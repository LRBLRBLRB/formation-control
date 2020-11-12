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

void collision(agents &agent)

void change(agents &agi, agents &agj)
void change2(agents &agi, agents &agj)

int main(int argc, char **argv) {
    ros::init(argc, argv, "swarm_robot_control_node");

    ros::NodeHandle nh;

    /////////////////////////////需要调整的参数////////////////////////////////////
    //设置机器人数量
    std::vector<int> current_robot_id{1, 2, 3, 4, 5};
    // std::vector<int> current_robot_id{ 6, 7, 8, 9, 10};

    int robot_num = current_robot_id.size();

    //收敛阈值
    bool is_conv = false;
    float conv_th = 0.05;  // in rad
    float lamda = 0.05;

    //
    unsigned int time_span = 5;   // 1*100 ms = 0.1s

    std::vector <std::vector<double>> current_robot_pose;
    current_robot_pose.clear();

    SwarmRobot swarm_robot(&nh, robot_num);
    ////
    Eigen::MatrixXd lap(robot_num, robot_num);
    lap << 4, -1, -1, -1, -1,
            -1, 4, -1, -1, -1,
            -1, -1, 4, -1, -1,
            -1, -1, -1, 4, -1,
            -1, -1, -1, -1, 4;

    Eigen::VectorXd x(robot_num);
    Eigen::VectorXd y(robot_num);
    Eigen::VectorXd theta(robot_num);

    Eigen::VectorXd x_d(robot_num);

    /////获取当前机器人的位姿 (x, y, theta // 弧度)
    while (current_robot_pose.size() == 0) {
        swarm_robot.getRobotPose(current_robot_id, current_robot_pose);
        ros::Duration(0.5).sleep();
    }

    agents agent[robot_num];
    for (int i = 0; i < robot_num; i++) {
        /////初始化
        agent[i].x = current_robot_pose[i][0];
        agent[i].y = current_robot_pose[i][1];
        agent[i].dir = current_robot_pose[i][2];
    }

    while (!is_conv) {
        signal(SIGINT, sighandle);

        x_d = -lap * x;

        std::vector <std::vector<unsigned int>> velc;

//        for (int i = 0; i < robot_num; i++) {
//            std::vector<unsigned int> vec;
//
//            cmds cmd(x_d[i], 0, theta(i));
//            agent[i].set_vel(x_d[i], 0);
//            vec = swarm_move(cmd);
//
//            std::cout << "robot_" << current_robot_id[i] << " v w: " << 0.0 << "  " << cmd.w << "   ";
//            std::cout << "转换速度: " << vec[0] << " " << vec[1] << " " << vec[2] << std::endl;
//            velc.push_back(vec);
//        }
        for (int i = 0; i < robot_num; i++) {
            agent[i].set_vel(x_d[i], 0);
        }

        // 计算是否会碰撞并修正
        collision(agent)

        for (int i = 0; i < robot_num; i++) {
            std::vector<unsigned int> vec;
            cmds cmd(agent[i].v*cos(agent[i].dir), agent[i].v*sin(agent[i].dir), theta(i));
            vec = swarm_move(cmd);

            std::cout << "robot_" << current_robot_id[i] << " v w: " << 0.0 << "  " << cmd.w << "   ";
            std::cout << "转换速度: " << vec[0] << " " << vec[1] << " " << vec[2] << std::endl;
            velc.push_back(vec);
        }

        swarm_robot.robotMove(current_robot_id, velc, time_span);

        ros::Duration(time_span * 100.0 / 1000.0).sleep();


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
        for (int i = 0; i < robot_num; i++) {
            theta(i) = current_robot_pose[i][2];
        }
    }

    swarm_robot.robotStopMove(current_robot_id);

    while (ros::ok()) {
        ros::spinOnce();
    }

    return 0;
}


void collision(agents &agent) {
    double mypos[5][2] = {0};
    int num = 5;
    double radius = 0.75;
    for (int i = 0; i < num; ++i) {
        mypos[i][0] = agent[i].x;
        mypos[i][1] = agent[i].y;
    }

    double rad_collsion = 0.15;
    for (int i = 0; i < num; ++i) {
        for (int j = 0; j < num; ++j) {
            if (j == i) { continue; }
            double length = 0;
            length = sqrt(pow(mypos[i][0] - mypos[j][0], 2) + pow(mypos[i][1] - mypos[j][1], 2));
            if (length < radius)&&(length > rad_collsion)
            {
                change(agent[i], agent[j])
            }
            else if (length < rad_collision) {
                // 距离过近需要急停
                cout << "Collsion:(" << i << "," << j << ")" << endl;
                agent[i].v_forward=0;
                agent[i].w=0;
                agent[j].v_forward=0;
                agent[j].w=0;
            }

        }
    }
}


void change(agents &agi, agents &agj){
    double alpha1=4,alpha2=3;
    double rad_collsion = 0.15,radius = 0.75;
    double theta=agi.dir;
    double deltaj[2]=0,rj[2]=0;
    double v_RRL[2]=0,v_RR=0;

    deltaj[0]=agj.x-agi.x;
    deltaj[1]=agj.y-agi.y;
    rj[0]=cos(theta)*deltaj[0]+sin(theta)*deltaj[1];
    rj[1]=-sin(theta)*deltaj[0]+cos(theta)*deltaj[1];

    norm_rj=sqrt(rj[0]*rj[0]+rj[1]*rj[1]);

    v_RRL[0]=-alpha1 * rj[0] / norm_rj * ((1 / norm_rj - 1 / rad_collision) - (1 / radius - 1 / rad_collision)) -
                alpha2 * rj[0] / norm_rj * (radius - norm_rj);
    v_RRL[1]=-alpha1 * rj[1] / norm_rj * ((1 / norm_rj - 1 / rad_collision) - (1 / radius - 1 / rad_collision)) -
                alpha2 * rj[1] / norm_rj * (radius - norm_rj);

    v_RR[0]=cos(theta)*v_RRL[0]-sin(theta)*v_RRL[1];
    v_RR[1]=sin(theta)*v_RRL[0]+cos(theta)*v_RRL[1];

    // 转换并赋值
    agi.v_forward =agi.v_forward+v_RR[0].x*cos(agi.dir)+v_RR[1]*sin(agi.dir);
    agi.w =agi.w+(-v_RR[0]*sin(agi.dir)+v_RR[0]*cos(agi.dir))/neck;
}

void change2(agents &agi, agents &agj){
    double alpha=0.5;
    double rj[2]=0,norm_rj=1;
    double cor_v[2]=0;
    int ex=5;

    rj[0]=agj.x-agi.x;
    rj[1]=agj.y-agi.y;
    norm_rj=sqrt(rj[0]*rj[0]+rj[1]*rj[1]);

    cor_v[0]=rj[0]/pow(norm_rj,ex)*alpha;
    cor_v[1]=rj[1]/pow(norm_rj,ex)*alpha;

    agj.v_forward =agj.v_forward+cor_v[0].x*cos(agj.dir)+cor_v[1]*sin(agj.dir);
    agj.w =agj.w+(-cor_v[0]*sin(agj.dir)+cor_v[0]*cos(agj.dir))/neck;

    agi.v_forward =agi.v_forward-(cor_v[0].x*cos(agi.dir)+cor_v[1]*sin(agi.dir));
    agi.w =agi.w-(-cor_v[0]*sin(agi.dir)+cor_v[0]*cos(agi.dir))/neck;
}