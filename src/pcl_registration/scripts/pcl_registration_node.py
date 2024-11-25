#!/usr/bin/env python3

import rospy
import open3d as o3d
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
import numpy as np

class PclProcessing:
    def __init__(self):
        rospy.init_node('pcl_processing_node', anonymous=True)

        # Subscribers
        self.sub_target = rospy.Subscriber('/time_stamp/camera_01/pcl', PointCloud2, self.camera_01_pcl_callback)
        self.sub_source = rospy.Subscriber('/time_stamp/camera_02/pcl', PointCloud2, self.camera_02_pcl_callback)

        # Publishers
        self.pcl_aligned_pub = rospy.Publisher('/pcl_registration/aligned_pcl', PointCloud2, queue_size=10)

        # Variables
        self.cloud1 = None
        self.cloud2 = None

        self.voxel_size = 0.052
        self.threshold = self.voxel_size * 1.1

        # Flags
        self.cloud_received_1_ = False
        self.cloud_received_2_ = False

    def ros_to_open3d(self, ros_cloud):
        # Convert ROS PointCloud2 message to a NumPy array
        points_list = []
        for point in pc2.read_points(ros_cloud, skip_nans=True):
            points_list.append([point[0], point[1], point[2]])
        # Create Open3D point cloud from NumPy array
        o3d_cloud = o3d.geometry.PointCloud()
        o3d_cloud.points = o3d.utility.Vector3dVector(np.array(points_list))
        return o3d_cloud

    def camera_01_pcl_callback(self, msg):
        # Convert ROS PointCloud2 to Open3D format
        self.cloud1 = self.ros_to_open3d(msg)
        self.cloud_received_1_ = True
        self.processing()

    def camera_02_pcl_callback(self, msg):
        self.cloud2 = self.ros_to_open3d(msg)
        self.cloud_received_2_ = True
        self.processing()

    def trim_point_cloud(self, point_cloud, max_distance):
        distances = np.asarray(point_cloud.points)
        distances = np.linalg.norm(distances, axis=1)
        indices = np.where(distances <= max_distance)[0]
        trimmed_point_cloud = point_cloud.select_by_index(indices)
        return trimmed_point_cloud

    def preprocess_point_cloud(self, pcd, voxel_size):
        pcd_down = pcd.voxel_down_sample(voxel_size)
        radius_normal = voxel_size * 4.5
        radius_feature = voxel_size * 7

        pcd_down.estimate_normals(
            o3d.geometry.KDTreeSearchParamHybrid(radius=radius_normal, max_nn=50)
        )

        pcd_fpfh = o3d.pipelines.registration.compute_fpfh_feature(
            pcd_down,
            o3d.geometry.KDTreeSearchParamHybrid(radius=radius_feature, max_nn=100)
        )
        return pcd_down, pcd_fpfh

    def execute_global_registration(self, source_down, target_down, source_fpfh, target_fpfh, voxel_size):
        distance_threshold = voxel_size * 1.1
        result = o3d.pipelines.registration.registration_ransac_based_on_feature_matching(
            source_down, target_down, source_fpfh, target_fpfh, True,
            distance_threshold,
            o3d.pipelines.registration.TransformationEstimationPointToPoint(False),
            3, [
                o3d.pipelines.registration.CorrespondenceCheckerBasedOnEdgeLength(0.9),
                o3d.pipelines.registration.CorrespondenceCheckerBasedOnDistance(distance_threshold)
            ], o3d.pipelines.registration.RANSACConvergenceCriteria(1000000, 0.999)
        )
        print(result)
        return result

    def processing(self):
        if self.cloud_received_1_ and self.cloud_received_2_:
            trimmed_source = self.trim_point_cloud(self.cloud1, max_distance=4.5)
            trimmed_target = self.trim_point_cloud(self.cloud2, max_distance=4.5)

            source_down, source_fpfh = self.preprocess_point_cloud(trimmed_source, self.voxel_size)
            target_down, target_fpfh = self.preprocess_point_cloud(trimmed_target, self.voxel_size)

            result_ransac = self.execute_global_registration(source_down, target_down,
                                                             source_fpfh, target_fpfh,
                                                             self.voxel_size)

            T = result_ransac.transformation

            reg_p2p = o3d.pipelines.registration.registration_icp(
                source_down, target_down, self.threshold, T,
                o3d.pipelines.registration.TransformationEstimationPointToPoint(),
                o3d.pipelines.registration.ICPConvergenceCriteria(max_iteration=1000)
            )

            #print(reg_p2p)

            T2 = reg_p2p.transformation
            
            source_down.transform(T2)
            aligned_cloud = source_down + target_down

            self.msg_aligned_pcl = self.open3d_to_ros(aligned_cloud)

            self.msg_aligned_pcl.header.frame_id = "base_link"
            self.msg_aligned_pcl.header.stamp = rospy.Time.now()

            self.pcl_aligned_pub.publish(self.msg_aligned_pcl)

            # Reset flags
            self.cloud_received_1_ = False
            self.cloud_received_2_ = False

    def open3d_to_ros(self, open3d_cloud):
        points = np.asarray(open3d_cloud.points)
        ros_cloud = pc2.create_cloud_xyz32(rospy.Header(), points)
        return ros_cloud

if __name__ == '__main__':
    try:
        PclProcessing()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
