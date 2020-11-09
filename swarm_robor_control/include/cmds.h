// cmds.h
#ifndef MY_CLASS_H // include guard
#define MY_CLASS_H
#include <cmath>
class cmds
{
public:
	cmds(float v_, float w_):v_forward(v_),w(w_){};
	cmds(float v_x, float v_y, double dir){
		v_forward = v_x*cos(dir) + v_y*sin(dir);
		w = (-sin(dir)*v_x+cos(dir)*v_y)/0.15;
	};
	float v_forward;
	float w;
};
#endif /* MY_CLASS_H */