//
// Created by dzin on 19-8-15.
//

#ifndef PROJECT_SERIAL_ZIGBEE_H
#define PROJECT_SERIAL_ZIGBEE_H

#endif //PROJECT_SERIAL_ZIGBEE_H

#include <ros/ros.h>
#include "serial/serial.h"  //ROS已经内置了的串口包
#include <std_msgs/String.h>
#include <std_msgs/Empty.h>
#include <string>
#include <string.h>
#include <sstream>
#include <iostream>
#include <fstream>
#include <vector>
#include <math.h>
#include <universal_msgs/RobotMove.h>

// [[[need to install serial pkg first!!!!!]]] sudo apt-get install ros-kinetic-serial
// 解析时按照对应解析
#define SCALE_F 10000.0f

#define  BYTE0(dwTemp)       ( *( (uint8_t *)(&dwTemp)	)  )
#define  BYTE1(dwTemp)       ( *( (uint8_t *)(&dwTemp) + 1) )
#define  BYTE2(dwTemp)       ( *( (uint8_t *)(&dwTemp) + 2) )
#define  BYTE3(dwTemp)       ( *( (uint8_t *)(&dwTemp) + 3) )

class SerialZigbee
{

public:

    std::string serial_num;
    int baud_rate;
    int time_out;

    SerialZigbee(ros::NodeHandle *nh);
    ~SerialZigbee();

    serial::Serial ser; //声明串口对象

    void serial_write_int(int data)
    {
        u_int8_t buffer[] = {BYTE0(data),BYTE1(data),BYTE2(data),BYTE3(data)};
        this->ser.write(buffer,4);
    }

// 发送程序
    void serial_write_data();

// 接受程序
    void parse_serial_data();

    ros::ServiceServer robotMoveServer;
    bool ServiceCallback(universal_msgs::RobotMove::Request &req, universal_msgs::RobotMove::Response &res);

};