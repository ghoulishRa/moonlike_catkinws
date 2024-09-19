#!/usr/bin/env python3

import rospy
import cv2
from sensor_msgs.msg import Image, PointCloud2
from geometry_msgs.msg import PoseStamped
import sensor_msgs.point_cloud2 as pc2
from std_msgs.msg import String
from cv_bridge import CvBridge
from datetime import datetime
import pcl
import numpy
import tf2_ros
import tf2_sensor_msgs
    
#comentario de prueba 

class ImagePublisher:
    def __init__(self):
        
        rospy.init_node('timestamp_node', anonymous=True)
        self.bridge = CvBridge()

        self.target_frame = "base_link"

        #subscriptions
        self.camera_01_sub_image = rospy.Subscriber('/camera_01/color/image_raw', Image, self.camera_01_image_callback)
        self.camera_01_sub_depth = rospy.Subscriber('/camera_01/depth/image_raw', Image, self.camera_01_depth_callback)
        self.camera_01_pointcloud_sub = rospy.Subscriber('/camera_01/depth/points', PointCloud2, self.camera_01_pcl_callback)
        self.camera_01_ir_sub = rospy.Subscriber('/camera_01/ir/image_raw', Image, self.camera_01_ir_callback)
        
        self.camera_02_image_sub = rospy.Subscriber('/camera_02/color/image_raw', Image, self.camera_02_image_callback)
        self.camera_02_sub_depth = rospy.Subscriber('/camera_02/image_raw', Image, self.camera_02_depth_callback)
        self.camera_02_pointcloud_sub = rospy.Subscriber('/camera_02/depth/points', PointCloud2, self.pcl_camera_02_callback)
        self.camera_02_ir_sub = rospy.Subscriber('/camera_02/ir/image_raw', Image, self.camera_02_ir_callback)

        self.pose_sub = rospy.Subscriber('/nanet_ros/Beenpuppycat/pose', PoseStamped, self.pose_callback)

        #publishers
        self.camera_01_image_pub = rospy.Publisher('/time_stamp/camera_01/image', Image, queue_size=10)
        self.camera_01_depth_pub = rospy.Publisher('/time_stamp/camera_01/depth', Image, queue_size=10)
        self.camera_01_ir_pub = rospy.Publisher('/time_stamp/camera_01/ir', Image, queue_size=10)
        self.camera_01_pcl_pub = rospy.Publisher('/time_stamp/camera_01/pcl', PointCloud2, queue_size=10)

        self.camera_02_image_pub = rospy.Publisher('/time_stamp/camera_02/image', Image, queue_size=10)
        self.camera_02_depth_pub = rospy.Publisher('/time_stamp/camera_02/depth', Image, queue_size=10)
        self.camera_02_ir_pub = rospy.Publisher('/time_stamp/camera_02/ir', Image, queue_size=10)
        self.camera_02_pcl_pub = rospy.Publisher('/time_stamp/camera_02/pcl', PointCloud2, queue_size=10)


        self.pose_pub = rospy.Publisher('/pose_copy', PoseStamped, queue_size=10)
        self.timestamp_pub = rospy.Publisher('/image_timestamp', String, queue_size=10)

        #timers
        self.timer = rospy.Timer(rospy.Duration(5), self.publish_image)

        #msgs 
        self.msg_camera_01_image = Image()
        self.msg_camera_01_depth = Image()
        self.msg_camera_01_ir = Image()
        self.msg_camera_01_pcl = PointCloud2()

        self.msg_camera_02_image = Image()
        self.msg_camera_02_depth = Image()
        self.msg_camera_02_ir = Image()
        self.msg_camera_02_pcl = PointCloud2()  

        self.pose = PoseStamped()

        # Initialize tf2 Buffer and Listener
        self.tf_buffer = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

    #subscriber callback
    def camera_01_image_callback(self, data):

        self.msg_camera_01_image = data

    def camera_01_depth_callback(self, data):
    
        self.msg_camera_01_depth = data

    def camera_01_ir_callback(self, data):

        self.msg_camera_01_ir = data


    def camera_02_image_callback(self, data):

        self.msg_camera_02_image = data

    def camera_02_depth_callback(self, data):
    
        self.msg_camera_02_depth = data

    def camera_02_ir_callback(self, data):

        self.msg_camera_02_ir = data

    def pcl_camera_02_callback(self, data):

        try:
            try:
                transform = self.tf_buffer.lookup_transform(self.target_frame , 
                                                            data.header.frame_id, 
                                                            rospy.Time(0), 
                                                            rospy.Duration(1.0))
                transformed_data = tf2_sensor_msgs.do_transform_cloud(data, transform)

            except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException) as e:
                rospy.logerr(f"Transform exception: {e}")
                return
            
            self.msg_camera_02_pcl = transformed_data
            
        except Exception as e:
            rospy.logerr(f"Failed to upload PCL file: {e}")

    def camera_01_pcl_callback(self, data):

        try:
            try:
                transform = self.tf_buffer.lookup_transform(self.target_frame , 
                                                            data.header.frame_id, 
                                                            rospy.Time(0), 
                                                            rospy.Duration(1.0))
                transformed_data = tf2_sensor_msgs.do_transform_cloud(data, transform)

            except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException) as e:
                rospy.logerr(f"Transform exception: {e}")
                return
            
            self.msg_camera_01_pcl = transformed_data
            
        except Exception as e:
            rospy.logerr(f"Failed to upload PCL file: {e}")

    def pose_callback(self, data):
        self.pose = data

    #publisher callback
    def publish_image(self, event):
    
        if (self.msg_camera_01_image and self.msg_camera_02_image) is not None:
            
            timestamp = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')

            self.camera_01_image_pub.publish(self.msg_camera_01_image)
            self.camera_01_depth_pub.publish(self.msg_camera_01_depth)
            self.camera_01_ir_pub.publish(self.msg_camera_01_ir)
            self.camera_01_pcl_pub.publish(self.msg_camera_01_pcl)

            self.camera_02_image_pub.publish(self.msg_camera_02_image)
            self.camera_02_depth_pub.publish(self.msg_camera_02_depth)
            self.camera_02_ir_pub.publish(self.msg_camera_02_ir)
            self.camera_02_pcl_pub.publish(self.msg_camera_02_pcl)

            self.pose_pub.publish(self.pose)
            self.timestamp_pub.publish(timestamp)

            rospy.loginfo(f'Datos publicados con timestamp {timestamp}')

if __name__ == '__main__':
    try:
        ImagePublisher()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass