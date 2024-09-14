#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/registration/icp.h>
#include <pcl/io/pcd_io.h>
#include <pcl/common/transforms.h>

typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;

class ICPAligner
{
public:
    ICPAligner() : nh_("~")
    {
        // Subscribers 
        cloud_sub_1_ = nh_.subscribe("/camera_01/pcl", 1, &ICPAligner::cloudCallback1, this);
        cloud_sub_2_ = nh_.subscribe("/camera_02/pcl", 1, &ICPAligner::cloudCallback2, this);

        // Publishers
        aligned_pub_ = nh_.advertise<PointCloud>("/aligned_cloud", 1);
        merged_pub_= nh_.advertise<PointCloud>("/merged_cloud", 1);

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
        if (cloud_received_1_ && cloud_received_2_)
        {
            // Perform ICP alignment
            pcl::IterativeClosestPoint<pcl::PointXYZ, pcl::PointXYZ> icp;
            icp.setInputSource(cloud1_.makeShared());
            icp.setInputTarget(cloud2_.makeShared());

            PointCloud::Ptr aligned_cloud(new PointCloud);
            icp.align(*aligned_cloud);

            // Check if ICP converged
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

            //creates the new Pointcloud type message

            PointCloud::Ptr merged_cloud(new PointCloud);
            *merged_cloud = cloud1_ + cloud2_;

            // Publish the merged cloud
            merged_pub_.publish(merged_cloud);

            // Reset flags
            cloud_received_1_ = false;
            cloud_received_2_ = false;
        }
    }

private:
    ros::NodeHandle nh_;
    ros::Subscriber cloud_sub_1_;
    ros::Subscriber cloud_sub_2_;
    ros::Publisher aligned_pub_;
    ros::Publisher merged_pub_;

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