//
// Created by dzin on 19-8-15.
//

#include <swarm_robot_control.h>

#include <ros/ros.h>
#include <sstream>
#include <string>
#include <cmath>

SwarmRobot::SwarmRobot(ros::NodeHandle *nh, int robot_num_):
        robot_num(robot_num_),
        queue_move(true)
{

    this->robotMoveClient = nh->serviceClient<universal_msgs::RobotMove>("robot_move_service");

}

SwarmRobot::~SwarmRobot()
{

}

bool SwarmRobot::getRobotPose(int id, std::vector<double> &pose)
{
    pose.resize(3,0.0);
    tf::StampedTransform transform;

    std::stringstream ss;

    ss<< "robot_"<<id;

    try
    {
        this->listener_.lookupTransform("base_marker", ss.str(), ros::Time(0), transform);
    }
    catch (tf::TransformException ex)
    {
        ROS_ERROR("%s",ex.what());
        ros::Duration(1.0).sleep();
        return false;
    }

    pose[0] = transform.getOrigin().x();
    pose[1] = transform.getOrigin().y();
    tf::Quaternion q = transform.getRotation();
    tf::Matrix3x3 m(q);
    double roll, pitch, yaw;
    m.getRPY(roll, pitch, yaw);
    pose[2] = yaw;
    ROS_INFO_STREAM("swarm node robot_" << id <<" x: "<< pose[0]<<" y: "<< pose[1] <<" theta: "<< pose[2]);
    return true;

}

bool SwarmRobot::getRobotPose(std::vector<int> &id, std::vector<std::vector<double>> &pose)
{
    pose.clear();

    std::vector<double> vec;
    for(int i=0; i< id.size(); i++)
    {
        if(getRobotPose(id[i], vec))
        {
            pose.push_back(vec);
            ROS_INFO_STREAM("robot " << id[i] << " pose: " << vec[0] << " "<< vec[1] << " "<< vec[2]);
        }
        else
        {
            return false;
        }
    }

    return true;

}

//调用函数
bool SwarmRobot::robotMove(int id, float v, float w, int time_span)
{
    //物理速度转换为小车底层速度(0-100)
    cmds cmd(v,w);
    std::vector<unsigned int> velc = swarm_move(cmd);

    if( ! robotMove(id, velc[0], velc[1], velc[2], time_span))
    {
        return false;
    }
    return true;
}

bool SwarmRobot::robotMove(int id, int dir, int speed_wheel_left, int speed_wheel_right, int time_span)
{

    this->robotMoveData.request.robot_id = id;
    this->robotMoveData.request.move_direction = dir;
    this->robotMoveData.request.speed_wheel_left = speed_wheel_left;
    this->robotMoveData.request.speed_wheel_right = speed_wheel_right;
    this->robotMoveData.request.time_span = time_span;

    if(this->robotMoveClient.call(robotMoveData))
    {
        return true;
    }

    ROS_INFO_STREAM("robot move error");
    return false;
}

//调用速度的函数
bool SwarmRobot::robotMove(std::vector<int> robot_ids,std::vector<std::vector<unsigned int>> &speed, int time_span)
{

    if(robot_ids.size()!=speed.size())
    {
        ROS_INFO_STREAM("robot num error");
        return false;
    }
    for(int i=0; i < robot_ids.size(); i++)
    {
        if( ! this->robotMove(robot_ids[i], speed[i][0],speed[i][1],speed[i][2],time_span))
        {
            return false;
        }
    }
    return true;
}

void SwarmRobot::robotStopMove(std::vector<int> robot_ids)
{
    for(int i=0; i<= robot_ids.size(); i++)
    {
        this->robotMove(robot_ids[i], 0, 0.0, 0.0, 0.0);
    }
}


bool SwarmRobot::getRelPose(int id1, int id2, std::vector<float> &pose1_to_2, float min_distance, float max_distance)
{

    tf::StampedTransform transform;
    try
    {
        this->listener_.lookupTransform("robot_" + std::to_string(id1), "robot_" + std::to_string(id2), ros::Time(0), transform);
    }
    catch (tf::TransformException ex)
    {
        ROS_ERROR("%s",ex.what());
        ros::Duration(1.0).sleep();
        return false;
    }

    pose1_to_2.resize(3);
    pose1_to_2[0] = transform.getOrigin().x();
    pose1_to_2[1] = transform.getOrigin().y();
    tf::Quaternion q = transform.getRotation();
    tf::Matrix3x3 m(q);
    double roll, pitch, yaw;
    m.getRPY(roll, pitch, yaw);
    pose1_to_2[2] = yaw*180.0/M_PI;

    if( ((pose1_to_2[0]*pose1_to_2[0] + pose1_to_2[1]*pose1_to_2[1]) > max_distance*max_distance)
        || ((pose1_to_2[0]*pose1_to_2[0] + pose1_to_2[1]*pose1_to_2[1]) < min_distance*min_distance))
    {
        pose1_to_2[0] = 0.0;
        pose1_to_2[1] = 0.0;
        pose1_to_2[2] = 0.0;
        return false;
    }

    return true;

}

