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

// [[[need to install serial pkg first!!!!!]]] sudo apt-get install ros-kinetic-serial
// 解析时按照对应解析
#define SCALE_F 10000.0f

#define  BYTE0(dwTemp)       ( *( (uint8_t *)(&dwTemp)	)  )
#define  BYTE1(dwTemp)       ( *( (uint8_t *)(&dwTemp) + 1) )
#define  BYTE2(dwTemp)       ( *( (uint8_t *)(&dwTemp) + 2) )
#define  BYTE3(dwTemp)       ( *( (uint8_t *)(&dwTemp) + 3) )

serial::Serial ser; //声明串口对象

int _pos[3] = {0,0,0};
int _angle[3] = {0,0,0};
int _check_sum = 0;
float float_angle[3];
float float_pos[3];
u_char begin[] = {0xfe,0x08,0x90,0x91,0x03,0x00};
u_char test_data[] = {0x23, 128 & 0xff ,0x23,0x23};
u_char end[] = {0xff};


void serial_write_int(int data)
{
    u_int8_t buffer[] = {BYTE0(data),BYTE1(data),BYTE2(data),BYTE3(data)};
    ser.write(buffer,4);
}

// 发送程序
void serial_write_data()
{
    for(int i = 0;i<3;i++)
    {
        _pos[i] = (int)(float_pos[i]*SCALE_F);
        _angle[i] = (int)(float_angle[i]*SCALE_F);
        _check_sum += _pos[i]+_angle[i];
    }
    ser.write(begin,6);
    ser.write(test_data,4);
    ser.write(end,1);
}

// 接受程序
void parse_serial_data(){

   // std::cout << "read\n";
    if(ser.available()){
        //std::cout << "available\n";
        static u_int8_t data;
        static u_int8_t buffer[8];
        ser.read(&data,1);//从串口读取数据并保存
        //std::cout << "read finish\n";
       // std::cout << data << std::endl;
        ROS_INFO("data[0] %X", data);
        if(data == 0xfe){
            data = '0';
            ser.read(&data,1);
            std::cout << data << std::endl;
            if (data == 0x08){
                ser.read(buffer,8);
                std::cout << data << std::endl;
                ROS_INFO("%X_%X_%X_%X_%X_%X_%X_%X",buffer[0],buffer[1],buffer[2],buffer[3],buffer[4],buffer[5],
                buffer[6],buffer[7]);
            }   
        }
    }
}

int main (int argc, char** argv) 
{   //指定循环的频率 
    //初始化节点

    ros::init(argc, argv, "serial_zigbee_receivenode");

    // ros::Rate loop_rate(50); 

    //声明节点句柄 
    ros::NodeHandle nh; 

    try 
    { 
    //设置串口属性，并打开串口 
        ser.setPort("/dev/ttyUSB1");
        ser.setBaudrate(9600);
        serial::Timeout to = serial::Timeout::simpleTimeout(1000); 
        ser.setTimeout(to); 
        ser.open(); 
    } 
    catch (serial::IOException& e) 
    { 
        ROS_ERROR_STREAM("Unable to open port "); 
        return -1; 
    } 

    //检测串口是否已经打开，并给出提示信息 
    if(ser.isOpen()) 
    { 
        ROS_INFO_STREAM("Serial Port initialized"); 
    } 
    else 
    { 
        return -1; 
    } 
    // serial_write_data();

    while(ros::ok()) 
    {
       // serial_write_data();
       //  write_callback_test();
        // loop_rate.sleep();
        parse_serial_data();
      //  ros::spinOnce();
        ros::Duration(0.001).sleep();
    } 
}
