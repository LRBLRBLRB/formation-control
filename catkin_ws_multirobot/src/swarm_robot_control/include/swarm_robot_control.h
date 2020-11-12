//
// Created by dzin on 19-8-15.
//

#include <eigen3/Eigen/Core>
#include <eigen3/Eigen/QR>
#include <eigen3/Eigen/Geometry>

#include <ros/ros.h>

#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <tf/tf.h>
#include <vector>

#include "vel_trans.h"

#include <universal_msgs/RobotMove.h>

class SwarmRobot{

public:

    SwarmRobot(ros::NodeHandle *nh, int );
    ~SwarmRobot();

    int robot_num;

    bool queue_move;

    bool getRobotPose(int id, std::vector<double> &pose);

    bool getRobotPose(std::vector<int> &id, std::vector<std::vector<double>> &pose);

    bool getRelPose(int id1, int id2, std::vector<float> &pose, float min_distance = 0.1, float max_distance = 1.0);

    bool robotMove(int id, float v, float w, int time_span);

    bool robotMove(int id, int dir, int wheel_speed_left, int wheel_speed_right, int time_span);

    bool robotMove(std::vector<int> robot_ids, std::vector<std::vector<unsigned int>> &speed, int time_span);

    void robotStopMove(std::vector<int> robot_ids);

    tf::TransformListener listener_;


private:

    ros::ServiceClient robotMoveClient;
    universal_msgs::RobotMove robotMoveData;

};
