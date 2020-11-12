//
// Created by dzin on 19-8-15.
//

#include <serial_zigbee.h>

int main (int argc, char** argv)
{   //指定循环的频率
    //初始化节点

    ros::init(argc,argv,"serial_zigbee_node");
    ros::NodeHandle nh;

    SerialZigbee sz(&nh);

    while(ros::ok())
    {
        ros::spinOnce();
        ros::Duration(0.001).sleep();
    }
}

