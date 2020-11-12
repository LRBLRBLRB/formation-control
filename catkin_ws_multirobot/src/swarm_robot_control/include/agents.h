// agents.h
#ifndef AGENTS_H // include guard
#define AGENTS_H
#include "iostream"
#include <cmath>
class agents
{
public:
	agents(float x_, float y_, float dir_):x(x_),y(y_),dir(dir_){}
	agents():x(0),y(0),dir(0),vx(0),vy(0){}

	float x;
	float y;
	float dir;
	void set_vel(float v_x, float v_y, float dir)
	{
		vx=v_x;
		vy=v_y;
		
		std::cout<<"v_x b4 set"<<v_x<<"v_y b4 set"<<v_y<<"dir"<<dir<<std::endl;
		v_forward = v_x*std::cos(dir) + v_y*std::sin(dir);
		w = (-std::sin(dir)*v_x+std::cos(dir)*v_y)/150;
		std::cout<<"v in set"<<v_forward<<"w in set"<<w<<std::endl;
	};
	float v_forward;
	float w;
	float vx;
	float vy;
};
#endif /* AGENTS_H */<