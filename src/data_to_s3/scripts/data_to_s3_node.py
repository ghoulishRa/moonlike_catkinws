#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image, PointCloud2
import sensor_msgs.point_cloud2 as pc2
from cv_bridge import CvBridge
import cv2
import boto3
import pcl
import os
from datetime import datetime
import numpy as np
from botocore.exceptions import NoCredentialsError, PartialCredentialsError

class ImageUploader:
    def __init__(self):
        rospy.init_node('image_to_s3_node', anonymous=True)

        # Initialize CvBridge
        self.bridge = CvBridge()

        # AWS S3 Configuration
        self.bucket_name = rospy.get_param('~bucket_name', 'ros-database-test')
        self.region_name = rospy.get_param('~region_name', 'us-east-2')  # e.g., 'us-west-2'

        # Initialize S3 client using environment variables or IAM roles
        try:
            self.s3_client = boto3.client('s3', region_name=self.region_name)
        except (NoCredentialsError, PartialCredentialsError):
            rospy.logerr("AWS credentials not found. Please configure your credentials.")
            rospy.signal_shutdown("AWS credentials not found.")

        # Subscribers gemini2L
        rospy.Subscriber("/time_stamp/camera_01/image/", Image, self.gemini2L_image_callback)
        rospy.Subscriber("/time_stamp/camera_01/depth/", Image, self.gemini2L_depth_callback)
        rospy.Subscriber("/time_stamp/camera_01/ir/", Image, self.gemini2L_ir_callback)
        rospy.Subscriber("/time_stamp/camera_01/pcl/", PointCloud2, self.gemini2L_pcl_callback)


        # Subscribers gemini2
        rospy.Subscriber("/time_stamp/camera_02/image/", Image, self.gemini2_image_callback)
        rospy.Subscriber("/time_stamp/camera_02/depth/", Image, self.gemini2_depth_callback)
        rospy.Subscriber("/time_stamp/camera_02/ir/", Image, self.gemini2_ir_callback)
        rospy.Subscriber("/time_stamp/camera_02/pcl/", PointCloud2, self.gemini2_pcl_callback)

    def gemini2L_image_callback(self, msg):
        try:
            # Convert ROS Image message to OpenCV image
            cv_image = self.bridge.imgmsg_to_cv2(msg, 'rgb8')

            # Generate a unique filename
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S%f")
            filename = f"gemini2l_raw_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, cv_image)

            subfolder = "gemini/gemini2L/images/raw/"
            s3_key = f"{subfolder}{filename}"

            # Upload the image to S3
            self.s3_client.upload_file(filename, self.bucket_name, s3_key)
            rospy.loginfo(f"Uploaded {filename} to S3 bucket {self.bucket_name}")

            # Remove the temporary file
            os.remove(filename)

        except Exception as e:
            rospy.logerr(f"Failed to upload image: {e}")
        
    def gemini2L_depth_callback(self, msg):
        try:

            cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='passthrough')

            depth_image_normalized = cv2.normalize(cv_image, None, 0, 255, cv2.NORM_MINMAX)

            # Convert to 8-bit image
            grayscale_image = np.uint8(depth_image_normalized)

            bgr_image = cv2.cvtColor(grayscale_image, cv2.COLOR_GRAY2BGR)

            # Generate a unique filename
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S%f")
            filename = f"gemini2L_depth_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, bgr_image)

            subfolder = "gemini/gemini2L/images/depth/"
            s3_key = f"{subfolder}{filename}"

            # Upload the image to S3
            self.s3_client.upload_file(filename, self.bucket_name, s3_key)
            rospy.loginfo(f"Uploaded {filename} to S3 bucket {self.bucket_name}")

            # Remove the temporary file
            os.remove(filename)

        except Exception as e:
            rospy.logerr(f"Failed to upload image: {e}")

    def gemini2L_ir_callback(self, msg):
        try:
            # Convert ROS Image message to OpenCV image
            cv_image = self.bridge.imgmsg_to_cv2(msg, 'mono8')

            # Generate a unique filename
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S%f")
            filename = f"gemini2L_ir_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, cv_image)

            subfolder = "gemini/gemini2L/images/ir/"
            s3_key = f"{subfolder}{filename}"

            # Upload the image to S3
            self.s3_client.upload_file(filename, self.bucket_name, s3_key)
            rospy.loginfo(f"Uploaded {filename} to S3 bucket {self.bucket_name}")

            # Remove the temporary file
            os.remove(filename)

        except Exception as e:
            rospy.logerr(f"Failed to upload image: {e}")
    
    def gemini2L_pcl_callback(self, msg):
        try:

            point_list = list(pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True))
            # Convert ROS PointCloud2 message to PCL data
            pcl_cloud = pcl.PointCloud()
            pcl_cloud.from_list(point_list)

            # Generate a unique filename for the PCL file
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S%f")
            pcl_filename = f"gemini2L_pcl_{timestamp}.pcd"

            # Save the PCL data to a temporary .pcd file
            pcl.save(pcl_cloud, pcl_filename)

            # Define the subfolder in the S3 bucket
            subfolder = "gemini/gemini2L/pointclouds/"  # Replace with your subfolder path
            s3_key = f"{subfolder}{pcl_filename}"

            # Upload the PCL file to S3 in the specified subfolder
            self.s3_client.upload_file(pcl_filename, self.bucket_name, s3_key)
            rospy.loginfo(f"Uploaded {pcl_filename} to S3 bucket {self.bucket_name} in subfolder {subfolder}")

            # Remove the temporary file
            os.remove(pcl_filename)

        except Exception as e:
            rospy.logerr(f"Failed to upload PCL file: {e}")

    ##gemini callbacks##

    def gemini2_image_callback(self, msg):
        try:
            # Convert ROS Image message to OpenCV image
            cv_image = self.bridge.imgmsg_to_cv2(msg, 'rgb8')

            # Generate a unique filename
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S%f")
            filename = f"gemini2_raw_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, cv_image)

            subfolder = "gemini/gemini2/images/raw/"
            s3_key = f"{subfolder}{filename}"

            # Upload the image to S3
            self.s3_client.upload_file(filename, self.bucket_name, s3_key)
            rospy.loginfo(f"Uploaded {filename} to S3 bucket {self.bucket_name}")

            # Remove the temporary file
            os.remove(filename)

        except Exception as e:
            rospy.logerr(f"Failed to upload image: {e}")
        
    def gemini2_depth_callback(self, msg):
        try:

            cv_image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='passthrough')

            depth_image_normalized = cv2.normalize(cv_image, None, 0, 255, cv2.NORM_MINMAX)

            # Convert to 8-bit image
            grayscale_image = np.uint8(depth_image_normalized)

            bgr_image = cv2.cvtColor(grayscale_image, cv2.COLOR_GRAY2BGR)

            # Generate a unique filename
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S%f")
            filename = f"gemini2_depth_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, bgr_image)

            subfolder = "gemini/gemini2/images/depth/"
            s3_key = f"{subfolder}{filename}"

            # Upload the image to S3
            self.s3_client.upload_file(filename, self.bucket_name, s3_key)
            rospy.loginfo(f"Uploaded {filename} to S3 bucket {self.bucket_name}")

            # Remove the temporary file
            os.remove(filename)

        except Exception as e:
            rospy.logerr(f"Failed to upload image: {e}")

    def gemini2_ir_callback(self, msg):
        try:
            # Convert ROS Image message to OpenCV image
            cv_image = self.bridge.imgmsg_to_cv2(msg, 'mono8')

            # Generate a unique filename
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S%f")
            filename = f"gemini2_ir_{timestamp}.jpg"

            # Save the image temporarily
            cv2.imwrite(filename, cv_image)

            subfolder = "gemini/gemini2/images/ir/"
            s3_key = f"{subfolder}{filename}"

            # Upload the image to S3
            self.s3_client.upload_file(filename, self.bucket_name, s3_key)
            rospy.loginfo(f"Uploaded {filename} to S3 bucket {self.bucket_name}")

            # Remove the temporary file
            os.remove(filename)

        except Exception as e:
            rospy.logerr(f"Failed to upload image: {e}")
    
    def gemini2_pcl_callback(self, msg):
        try:

            point_list = list(pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True))
            # Convert ROS PointCloud2 message to PCL data
            pcl_cloud = pcl.PointCloud()
            pcl_cloud.from_list(point_list)

            # Generate a unique filename for the PCL file
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S%f")
            pcl_filename = f"gemini2_pcl_{timestamp}.pcd"

            # Save the PCL data to a temporary .pcd file
            pcl.save(pcl_cloud, pcl_filename)

            # Define the subfolder in the S3 bucket
            subfolder = "gemini/gemini2/pointclouds/"  # Replace with your subfolder path
            s3_key = f"{subfolder}{pcl_filename}"

            # Upload the PCL file to S3 in the specified subfolder
            self.s3_client.upload_file(pcl_filename, self.bucket_name, s3_key)
            rospy.loginfo(f"Uploaded {pcl_filename} to S3 bucket {self.bucket_name} in subfolder {subfolder}")

            # Remove the temporary file
            os.remove(pcl_filename)

        except Exception as e:
            rospy.logerr(f"Failed to upload PCL file: {e}")

if __name__ == '__main__':
    try:
        uploader = ImageUploader()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass