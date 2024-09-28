#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image, PointCloud2
import sensor_msgs.point_cloud2 as pc2
from cv_bridge import CvBridge
import cv2
import pcl
import os
from datetime import datetime
import numpy as np

class ImageUploader:
    def __init__(self):
        rospy.init_node('image_to_s3_node', anonymous=True)

        # Initialize CvBridge
        self.bridge = CvBridge()

        # Subscribers camera_01
        rospy.Subscriber("/time_stamp/camera_01/image/", Image, self.camera_01_image_callback)
        rospy.Subscriber("/time_stamp/camera_01/depth/", Image, self.camera_01_depth_callback)
        rospy.Subscriber("/time_stamp/camera_01/ir/", Image, self.camera_01_ir_callback)
        rospy.Subscriber("/time_stamp/camera_01/pcl/", PointCloud2, self.camera_01_pcl_callback)


        # Subscribers camera_02
        rospy.Subscriber("/time_stamp/camera_02/image/", Image, self.camera_02_image_callback)
        rospy.Subscriber("/time_stamp/camera_02/depth/", Image, self.camera_02_depth_callback)
        rospy.Subscriber("/time_stamp/camera_02/ir/", Image, self.camera_02_ir_callback)
        rospy.Subscriber("/time_stamp/camera_02/pcl/", PointCloud2, self.camera_02_pcl_callback)

        #Global subscriptions

        rospy.Subscriber("/pcl_registration/aligned_pcl", PointCloud2, self.icp_pointcloud_callback)
        rospy.Subscriber("/time_stamp/thermal/image", Image, self.thermal_callback)        

    def camera_01_image_callback(self, msg):
        try:
            
            cv_image = self.bridge.imgmsg_to_cv2(msg, 'bgr8')

            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S%f")
            filename = f"camera_01_raw_{timestamp}.jpg"
            directory = f"/root/rosbag/timestamp/camera_01/image"

            full_path = os.path.join(directory, filename)

            # Save the image temporarily
            cv2.imwrite(full_path, cv_image)

            rospy.loginfo(f"Succesfully to upload camera_01 image")

        except Exception as e:
            rospy.logerr(f"Failed to upload camera_01 image: {e}")
        
    def camera_01_depth_callback(self, msg):
        try:

            cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='passthrough')

            depth_image_normalized = cv2.normalize(cv_image, None, 0, 255, cv2.NORM_MINMAX)

            # Convert to 8-bit image
            grayscale_image = np.uint8(depth_image_normalized)

            bgr_image = cv2.cvtColor(grayscale_image, cv2.COLOR_GRAY2BGR)

            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S%f")
            filename = f"/root/rosbag/timestamp/camera_01/depth/camera_01_depth_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, bgr_image)

        except Exception as e:
            rospy.logerr(f"Failed to upload camera_01 depth: {e}")

    def camera_01_ir_callback(self, msg):
        try:
            
            cv_image = self.bridge.imgmsg_to_cv2(msg, 'mono8')

            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S%f")
            filename = f"/root/rosbag/timestamp/camera_01/ir/camera_01_ir_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, cv_image)

        except Exception as e:
            rospy.logerr(f"Failed to upload camera_01 ir: {e}")
    
    def camera_01_pcl_callback(self, msg):
        try:

            point_list = list(pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True))
            # Convert ROS PointCloud2 message to PCL data
            pcl_cloud = pcl.PointCloud()
            pcl_cloud.from_list(point_list)

            # Generate a unique filename for the PCL file
            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S%f")
            pcl_filename = f"/root/rosbag/timestamp/camera_01/pcl/camera_01_pcl_{timestamp}.pcd"

            # Save the PCL data to a temporary .pcd file
            pcl.save(pcl_cloud, pcl_filename)

        except Exception as e:
            rospy.logerr(f"Failed to upload camera_01 pcd: {e}")

    ##gemini callbacks##

    def camera_02_image_callback(self, msg):
        try:
            
            cv_image = self.bridge.imgmsg_to_cv2(msg, 'bgr8')

            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S%f")
            filename = f"/root/rosbag/timestamp/camera_02/image/camera_02_raw_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, cv_image)

        except Exception as e:
            rospy.logerr(f"Failed to upload camera_02 image: {e}")
        
    def camera_02_depth_callback(self, msg):
        try:

            cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='passthrough')

            depth_image_normalized = cv2.normalize(cv_image, None, 0, 255, cv2.NORM_MINMAX)

            # Convert to 8-bit image
            grayscale_image = np.uint8(depth_image_normalized)

            bgr_image = cv2.cvtColor(grayscale_image, cv2.COLOR_GRAY2BGR)

            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S%f")
            filename = f"/root/rosbag/timestamp/camera_02/depth/camera_02_depth_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, bgr_image)


        except Exception as e:
            rospy.logerr(f"Failed to upload camera_02 depth: {e}")

    def camera_02_ir_callback(self, msg):
        try:
            
            cv_image = self.bridge.imgmsg_to_cv2(msg, 'mono8')

            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S%f")
            filename = f"/root/rosbag/timestamp/camera_02/ir/camera_02_ir_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, cv_image)

        except Exception as e:
            rospy.logerr(f"Failed to upload camera_02 ir: {e}")
    
    def camera_02_pcl_callback(self, msg):
        try:

            point_list = list(pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True))
            # Convert ROS PointCloud2 message to PCL data
            pcl_cloud = pcl.PointCloud()
            pcl_cloud.from_list(point_list)

            # Generate a unique filename for the PCL file
            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S%f")
            pcl_filename = f"/root/rosbag/timestamp/camera_02/pcl/camera_02_pcl_{timestamp}.pcd"

            # Save the PCL data to a temporary .pcd file
            pcl.save(pcl_cloud, pcl_filename)

        except Exception as e:
            rospy.logerr(f"Failed to upload camera_02 pcd: {e}")


    def icp_pointcloud_callback(self, msg):
        try:

            point_list = list(pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True))
            # Convert ROS PointCloud2 message to PCL data
            pcl_cloud = pcl.PointCloud()
            pcl_cloud.from_list(point_list)

            # Generate a unique filename for the PCL file
            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S%f")
            pcl_filename = f"/root/rosbag/timestamp/aligned_pcl/aligned_pcl_{timestamp}.pcd"

            # Save the PCL data to a temporary .pcd file
            pcl.save(pcl_cloud, pcl_filename)

        except Exception as e:
            rospy.logerr(f"Failed to upload aligned PCL aligned file: {e}")

    def thermal_callback (self, msg):

        try:

            cv_image = self.bridge.imgmsg_to_cv2(msg, 'mono8')

            timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S%f")
            filename = f"/root/rosbag/timestamp/thermal/thermal_image_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, cv_image)

        except Exception as e:
        
            rospy.logerr(f"Failed to upload thermal image: {e}")


if __name__ == '__main__':
    try:
        uploader = ImageUploader()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass