#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/registration/icp.h>
#include <pcl/io/pcd_io.h>
#include <pcl/common/transforms.h>
#include <pcl/filters/voxel_grid.h>  
#include <pcl/filters/passthrough.h>
#include <pcl/filters/crop_box.h>
#include <pcl/registration/icp.h>
#include <pcl/io/pcd_io.h>

typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;

class ICPAligner
{
public:
    ICPAligner() : nh_("~")
    {
        // Subscribers 
        cloud_sub_1_ = nh_.subscribe("/time_stamp/camera_01/pcl", 1, &ICPAligner::cloudCallback1, this);
        cloud_sub_2_ = nh_.subscribe("/time_stamp/camera_02/pcl", 1, &ICPAligner::cloudCallback2, this);

        // Publishers
        aligned_pub_ = nh_.advertise<PointCloud>("/aligned_cloud", 1);
        merged_pub_ = nh_.advertise<PointCloud>("/merged_cloud", 1);
        
        // Additional publishers for processed point clouds
        pcl_cam_01_pub_ = nh_.advertise<PointCloud>("/pcl_process/pcl_cam_01", 1);
        pcl_cam_02_pub_ = nh_.advertise<PointCloud>("/pcl_process/pcl_cam_02", 1);

        // Flags 
        cloud_received_1_ = false;
        cloud_received_2_ = false;
    }

    void cloudCallback1(const PointCloud::ConstPtr& cloud1)
    {
        cloud1_ = *cloud1; // Save the first point cloud
        cloud_received_1_ = true;
        alignPointClouds();
    }

    void cloudCallback2(const PointCloud::ConstPtr& cloud2)
    {
        cloud2_ = *cloud2; // Save the second point cloud
        cloud_received_2_ = true;
        alignPointClouds();
    }

    void alignPointClouds()
    {
        if (cloud_received_1_ && cloud_received_2_) {

            // Step 1: Apply PassThrough filter to cloud1
            pcl::PassThrough<pcl::PointXYZ> pass;
            pass.setFilterFieldName("x");
            pass.setFilterLimits(-1.0, 1.0); // Keep points between 0.2m and 1.0m from the camera

            PointCloud::Ptr cloud1_filtered(new PointCloud);
            pass.setInputCloud(cloud1_.makeShared());
            pass.filter(*cloud1_filtered);

            // Step 2: Apply CropBox filter to cloud1
            pcl::CropBox<pcl::PointXYZ> crop_box;
            crop_box.setMin(Eigen::Vector4f (-1.0f, -1.0f, -1.0f, 1.0f));
            crop_box.setMax(Eigen::Vector4f (1.0f, 1.0f, 1.0f, 1.0f));
            crop_box.setInputCloud(cloud1_filtered);
            crop_box.filter(*cloud1_filtered);

            // Step 3: Apply PassThrough filter to cloud2
            PointCloud::Ptr cloud2_filtered(new PointCloud);
            pass.setInputCloud(cloud2_.makeShared());
            pass.filter(*cloud2_filtered);  

            // Step 4: Apply CropBox filter to cloud2
            crop_box.setInputCloud(cloud2_filtered);
            crop_box.filter(*cloud2_filtered);

            // Step 5: Downsample the point clouds
            pcl::VoxelGrid<pcl::PointXYZ> voxel_filter;
            voxel_filter.setLeafSize(0.01f, 0.01f, 0.01f);  // Adjust leaf size as needed

            // Downsample cloud1
            voxel_filter.setInputCloud(cloud1_filtered);
            PointCloud::Ptr cloud1_downsampled(new PointCloud);
            voxel_filter.filter(*cloud1_downsampled);

            // Downsample cloud2
            voxel_filter.setInputCloud(cloud2_filtered);
            PointCloud::Ptr cloud2_downsampled(new PointCloud);
            voxel_filter.filter(*cloud2_downsampled);

            // Step 6: Publish the processed point clouds to the new topics
            cloud1_downsampled->header.frame_id = "base_link"; // Set the correct frame
            pcl_cam_01_pub_.publish(*cloud1_downsampled);

            cloud2_downsampled->header.frame_id = "base_link"; // Set the correct frame
            pcl_cam_02_pub_.publish(*cloud2_downsampled);

            // Step 7: Perform ICP alignment
            pcl::IterativeClosestPoint<pcl::PointXYZ, pcl::PointXYZ> icp;
            icp.setInputSource(cloud1_downsampled);
            icp.setInputTarget(cloud2_downsampled);

            icp.setMaximumIterations(45);  // Adjust the number of iterations as needed
            icp.setMaxCorrespondenceDistance(0.2);
            icp.setTransformationEpsilon(1e-6);

            PointCloud::Ptr aligned_cloud(new PointCloud);
            icp.align(*aligned_cloud);

            // Step 8: Check if ICP converged
            if (icp.hasConverged())
            {
                ROS_INFO("ICP converged with score: %f", icp.getFitnessScore());

                // Publish the aligned point cloud
                aligned_cloud->header.frame_id = "base_link"; // Adjust the frame as necessary
                aligned_pub_.publish(*aligned_cloud);
            }
            else
            {
                ROS_WARN("ICP did not converge.");
            }
        }
    }

private:
    ros::NodeHandle nh_;
    ros::Subscriber cloud_sub_1_;
    ros::Subscriber cloud_sub_2_;
    ros::Publisher aligned_pub_;
    ros::Publisher merged_pub_;

    // Additional publishers for processed point clouds
    ros::Publisher pcl_cam_01_pub_;
    ros::Publisher pcl_cam_02_pub_;

    PointCloud cloud1_;
    PointCloud cloud2_;
    bool cloud_received_1_;
    bool cloud_received_2_;
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "icp_aligner_node");
    ICPAligner aligner;
    ros::spin();
    return 0;
}
