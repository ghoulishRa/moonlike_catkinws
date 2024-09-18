#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
import tf2_ros
from sensor_msgs.msg import Image, CameraInfo
from geometry_msgs.msg import PoseStamped, TransformStamped
from cv_bridge import CvBridge

class VisualOdometry:
    def __init__(self):
        # ROS initialization
        rospy.init_node('visual_odometry_node', anonymous=True)
        
        # Variables for camera intrinsics
        self.K = None  # Camera intrinsic matrix
        self.dist_coeffs = None  # Distortion coefficients
        
        # Initialize variables
        self.bridge = CvBridge()
        self.prev_frame = None
        self.prev_keypoints = None
        self.prev_descriptors = None
        self.pose = np.eye(4)  # Initial pose (4x4 Identity matrix)
        self.orb = cv2.ORB_create(3000)  # Feature detector
        
        # ROS Publishers and Subscribers
        self.cameraInfo_sub = rospy.Subscriber('/camera_01/color/camera_info', CameraInfo, self.camera_info_callback)
        self.video_sub = rospy.Subscriber('/camera_01/color/image_raw', Image, self.image_callback)
        self.pose_pub = rospy.Publisher('/camera_pose', PoseStamped, queue_size=10)
        
        # TF Broadcaster
        self.br = tf2_ros.TransformBroadcaster()

        # Timer to publish the pose and transform at 10 Hz
        self.timer = rospy.Timer(rospy.Duration(0.1), self.timer_callback)
        
        # Initialize position
        self.x = 0
        self.y = 0
        self.z = 0

    def camera_info_callback(self, msg):
        # Extract camera intrinsics from the CameraInfo message
        self.K = np.array(msg.K).reshape(3, 3)  # 3x3 intrinsic matrix
        self.dist_coeffs = np.array(msg.D)  # Distortion coefficients
        
        # Unsubscribe from this topic once we've obtained the camera parameters
        self.cameraInfo_sub.unregister()
        rospy.loginfo("Camera intrinsics received")

    def image_callback(self, msg):
        # Convert ROS Image message to OpenCV format
        frame = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        gray_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        
        if self.K is None:
            rospy.logwarn("Camera intrinsics not yet available!")
            return
        
        # If this is the first frame, just detect keypoints and skip to the next frame
        if self.prev_frame is None:
            self.prev_frame = gray_frame
            self.prev_keypoints, self.prev_descriptors = self.orb.detectAndCompute(self.prev_frame, None)
            return
        
        # Detect keypoints and descriptors in the current frame
        keypoints, descriptors = self.orb.detectAndCompute(gray_frame, None)
        if descriptors is None or len(descriptors) < 5:
            rospy.logwarn("Not enough descriptors!")
            return
        
        # Match features between the current and previous frame using KNN
        matches = self.match_features(self.prev_descriptors, descriptors)
        
        if len(matches) < 8:
            rospy.logwarn("Not enough good matches!")
            return
        
        # Extract matched points
        prev_pts = np.float32([self.prev_keypoints[m.queryIdx].pt for m in matches])
        curr_pts = np.float32([keypoints[m.trainIdx].pt for m in matches])
        
        # Compute Essential Matrix and recover pose
        E, mask = cv2.findEssentialMat(curr_pts, prev_pts, self.K, method=cv2.RANSAC, prob=0.999, threshold=1.0)
        _, R, t, mask = cv2.recoverPose(E, curr_pts, prev_pts, self.K)
        
        # Update the camera pose
        self.update_pose(R, t)
        
        # Update the x, y, z for publishing
        self.x = (self.pose[0, 3])/100.0
        self.y = (self.pose[2, 3])/100.0
        self.z = (self.pose[1, 3])/100.0
        
        # Update previous frame and keypoints for the next iteration
        self.prev_frame = gray_frame
        self.prev_keypoints = keypoints
        self.prev_descriptors = descriptors
    
    def match_features(self, desc1, desc2):
        # Use BFMatcher with Hamming distance and KNN for better matching
        bf = cv2.BFMatcher(cv2.NORM_HAMMING)
        
        # Perform KNN matching, with k=2 (finds 2 nearest matches for each descriptor)
        knn_matches = bf.knnMatch(desc1, desc2, k=2)
        
        # Apply Lowe's ratio test to filter out weak matches
        good_matches = []
        ratio_thresh = 0.75  # Lowe's ratio test threshold
        for m, n in knn_matches:
            if m.distance < ratio_thresh * n.distance:
                good_matches.append(m)
        
        return good_matches

    def update_pose(self, R, t):
        # Form the transformation matrix
        T = np.eye(4)
        T[:3, :3] = R
        T[:3, 3] = t[:, 0]
        
        # Update the overall pose by multiplying the current pose by the transformation
        self.pose = np.dot(self.pose, T)

    def timer_callback(self, event):
        # Publish the pose as PoseStamped
        self.publish_pose_stamped()

        # Broadcast the transform
        self.publish_tf(self.x, self.y, self.z)

    def publish_pose_stamped(self):
        # Create a PoseStamped message to include the position and the timestamp
        pose_stamped_msg = PoseStamped()
        
        # Set the current time in the header
        pose_stamped_msg.header.stamp = rospy.Time.now()
        pose_stamped_msg.header.frame_id = "map"  # You can change this to the relevant frame
        
        # Set the position (x, y, z)
        pose_stamped_msg.pose.position.x = self.x
        pose_stamped_msg.pose.position.y = self.y
        pose_stamped_msg.pose.position.z = self.z
        
        # Set orientation to identity quaternion (no rotation)
        pose_stamped_msg.pose.orientation.x = 0
        pose_stamped_msg.pose.orientation.y = 0
        pose_stamped_msg.pose.orientation.z = 0
        pose_stamped_msg.pose.orientation.w = 1
        
        # Publish the PoseStamped message
        self.pose_pub.publish(pose_stamped_msg)
        rospy.loginfo(f"Published PoseStamped: x={self.x}, y={self.y}, z={self.z}")

    def publish_tf(self, x, y, z):
        # Get current time
        current_time = rospy.Time.now()

        # Create a TransformStamped message
        transform = TransformStamped()

        # Set frame id (parent) and child frame id
        transform.header.stamp = current_time
        transform.header.frame_id = "map"  # Parent frame
        transform.child_frame_id = "base_link"  # Child frame

        # Set translation (x, y, z)
        transform.transform.translation.x = x
        transform.transform.translation.y = y
        transform.transform.translation.z = z

        # Set orientation (identity quaternion for no rotation)
        transform.transform.rotation.x = 0
        transform.transform.rotation.y = 0
        transform.transform.rotation.z = 0
        transform.transform.rotation.w = 1  # Quaternion (0, 0, 0, 1) is identity rotation

        # Send the transform
        self.br.sendTransform(transform)

        rospy.loginfo(f"Broadcasting transform: x={x}, y={y}, z={z}")

if __name__ == '__main__':
    try:
        vo = VisualOdometry()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
