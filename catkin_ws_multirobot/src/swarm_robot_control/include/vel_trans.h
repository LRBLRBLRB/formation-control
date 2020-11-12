#include <iostream>
#include <vector>
#include "cmath"
#include <stdio.h>
#include "cmds.h"


//in mm
#define CAR_R 85
#define CAR_D 170
#define CAR_V_MAX 180
#define CAR_V_MIN 0


// 适用stepmotor_zigbee
//double vel_fun(int x);
//
//将初始给定速度转化为0-100的速度值
//int velocity_fit(double v);

std::vector<unsigned int> swarm_move(cmds cmd);