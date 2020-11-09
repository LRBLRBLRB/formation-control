//
// Created by aemc4 on 2019/11/27.
//

#include "vel_trans.h"

//对应小车底盘代码stepmotor_zigbee
//double vel_fun(int x)
//{
//    double f;
//    double k6,k5,k4,k3,k2,k1,k0;
//    k6 = 5.38657970076934e-10;
//    k5 = -1.36546632491549e-07;
//    k4 = 1.31790053224565e-05;
//    k3 = -0.000588823120101647;
//    k2 = 0.0121649049529078;
//    k1 = -0.0728952919374400;
//    k0 = 1.93641915238629;
//    f = k6*pow(x,6)+k5*pow(x,5) + k4*pow(x,4) + k3*pow(x,3) + k2*x*x + k1*x + k0; //原函数
////    std::cout<<"the f is: "<<f<<std::endl;
//    return f;
//}

//将初始给定速度转化为CAR_V_MIN-CAR_V_MAX的速度值
//int velocity_fit(double v)
//{
//    int x = 0;
//    int v_fit;
//    double v_abs = fabs(v);
//    if (v_abs >= CAR_V_MAX) v_abs = CAR_V_MAX;
//
//    double f = vel_fun(x); //原函数
//    if (v_abs <= 1)
//    {
//        v_fit = 0;
//        if(v_abs > 0.0)
//            v_fit = 1;
//    }
//    else
//    {
//        if (v_abs >= 18)
//            v_fit = 100;
//        else
//        {
//            if(v_abs<=2 && v_abs>=1 )
//                v_fit = 1;
//            else
//            {
//                for(x=0;v_abs-f>0;x++)
//                {
//                    f = vel_fun(x);
//                }
//
//                double g,g1;
//                g = v_abs - vel_fun(x);
//
//                g1 = v_abs - vel_fun(x-1);
//
//                if (fabs(g)<fabs(g1))
//                {
//                    v_fit = x;
//                }
//                else
//                {
//                    v_fit = x-1;
//                }
//
//            }
//        }
//
//    }
//    return v_fit;
//}

// v>=0
int velocity_fit(double v)
{
    double v_abs = fabs(v);
    int v_fit;
    if (v_abs >= CAR_V_MAX)
    {
        v_fit = CAR_V_MAX;
    }
    else
    {
        v_fit = v_abs;
    }
    return v_fit;
}


//v: mm/s    w:rad/s
std::vector<unsigned int> swarm_move(cmds cmd)
{

    double v = cmd.v_forward;
    double w = cmd.w;
    int car_mode = 0;
    int car_speed_left = 0;
    int car_speed_right = 0;
    std::vector<unsigned int> motion;
    motion.resize(3);

    if (v>0)
    {
        if ( v >= fabs(w*CAR_R))  car_mode = 1;
        else
        {
            if (w > 0)  car_mode = 3;
            if (w < 0)  car_mode = 4;
        }
        car_speed_left  = velocity_fit(v - w*CAR_R);
        car_speed_right = velocity_fit(v + w*CAR_R);
    }

    if (v<0)
    {
        if (-v >= fabs(w*CAR_R)) car_mode = 2;
        else
        {
            if (w > 0)  car_mode = 3;
            if (w < 0)  car_mode = 4;
        }
        car_speed_left  = velocity_fit(v - w*CAR_R);
        car_speed_right = velocity_fit(v + w*CAR_R);
    }

    if (std::abs(v) <  0.000001)
    {
        if (w > 0)    car_mode = 3;
        if (w < 0)    car_mode = 4;
        car_speed_left  = velocity_fit(v - w*CAR_R);
        car_speed_right = velocity_fit(v + w*CAR_R);
    }


    motion[0] = car_mode;
    motion[1] = car_speed_left;
    motion[2] = car_speed_right;

    return motion;
}
