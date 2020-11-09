//
// Created by dzin on 19-8-15.
//


#include <swarm_robot_control.h>

#include<cmath>
#include<iostream>

#include "vel_trans.h"
#include <signal.h>
#include "cmds.h"
#include "agents.h"

using namespace std;

void sighandle(int sig) {
    std::cout << std::endl << "force to exit" << std::endl;
    _exit(0);
}

int main(int argc, char ** argv)
{
    ros::init(argc,argv,"swarm_robot_control_node");

    ros::NodeHandle nh;

    /////////////////////////////需要调整的参数////////////////////////////////////
    //设置机器人数量
    std::vector<int> current_robot_id{ 1, 2, 3, 4, 5};
   // std::vector<int> current_robot_id{ 6, 7, 8, 9, 10};

    int robot_num = current_robot_id.size();

    //收敛阈值
    bool is_conv = false;
    float conv_th = 0.05;  // in rad
    float lamda = 0.05;

    //
    unsigned int time_span = 5;   // 1*100 ms = 0.1s

    std::vector<std::vector<double>> current_robot_pose;
    current_robot_pose.clear();

    SwarmRobot swarm_robot(&nh, robot_num);
    ////
    Eigen::MatrixXd lap(robot_num, robot_num);
    lap <<   4, -1, -1, -1, -1,
            -1,  4, -1, -1, -1,
            -1, -1,  4, -1, -1,
            -1, -1, -1,  4, -1,
            -1, -1, -1, -1,  4 ;

    Eigen::VectorXd x(robot_num);
    Eigen::VectorXd y(robot_num);
    Eigen::VectorXd theta(robot_num);
    
    Eigen::VectorXd x_d(robot_num);

    /////获取当前机器人的位姿 (x, y, theta // 弧度)
    while(current_robot_pose.size() == 0)
    {
        swarm_robot.getRobotPose(current_robot_id, current_robot_pose);
        ros::Duration(0.5).sleep();
    }

    agents agent[robot_num];
    for(int i=0 ;i<robot_num; i++)
    {
        /////初始化
        agent[i].x = current_robot_pose[i][0];
        agent[i].y = current_robot_pose[i][1];
        agent[i].dir = current_robot_pose[i][2];
    }

    while(!is_conv)
    {
        signal(SIGINT, sighandle);

        x_d = - lap*x;

        std::vector<std::vector<unsigned int>> velc;

        for(int i=0 ; i<robot_num; i++)
        {
            std::vector<unsigned int> vec;
            
            cmds cmd(x_d[i],0,theta(i));
            agent[i].set_vel(x_d[i],0);
            vec = swarm_move(cmd);

            std::cout << "robot_"<< current_robot_id[i]<< " v w: " << 0.0 << "  "<< cmd.w <<"   ";
            std::cout <<"转换速度: "<<vec[0]<< " "  << vec[1] << " " << vec[2] <<std::endl;
            velc.push_back(vec);
        }

        swarm_robot.robotMove(current_robot_id, velc, time_span);

        ros::Duration(time_span*100.0/1000.0).sleep();


        //////
        // is_conv  = true;
        // for(int i=0; i< robot_num; i++)
        // {
        //     if(std::abs(theta_(i)) > conv_th)
        //     {
        //         is_conv = false;
        //     }
        // }


        //////
        swarm_robot.getRobotPose(current_robot_id, current_robot_pose);
        for(int i=0 ;i<robot_num; i++)
        {
            theta(i) = current_robot_pose[i][2];
        }
    }

    swarm_robot.robotStopMove(current_robot_id);

    while(ros::ok())
    {
        ros::spinOnce();
    }

    return 0;
}