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
};
#endif /* AGENTS_H */