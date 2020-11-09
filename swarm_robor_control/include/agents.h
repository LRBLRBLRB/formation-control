// agents.h
#ifndef AGENTS_H // include guard
#define AGENTS_H
class agents
{
public:
	agents(float x_, float y_, float dir_):x(x_),y(y_),dir(dir_){};
	float x;
	float y;
	float dir;
	void set_vel(v_x,v_y,dir)
	{
		v_forward = v_x*cos(dir) + v_y*sin(dir);
		w = (-sin(dir)*v_x+cos(dir)*v_y)/0.15;
	};
	float v_forward;
	float w;
};
#endif /* AGENTS_H */