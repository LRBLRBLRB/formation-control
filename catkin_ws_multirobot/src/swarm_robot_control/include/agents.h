// agents.h
#ifndef AGENTS_H // include guard
#define AGENTS_H

#include "iostream"
#include <cmath>

class agents {
public:
    agents(float x_, float y_, float dir_) : x(x_), y(y_), dir(dir_) {}

    agents() : x(0), y(0), dir(0), vx(0), vy(0) {}

    float x;
    float y;
    float dir;

    void set_vel(float v_x, float v_y, float dir) {
        vx = v_x;
        vy = v_y;

        std::cout << "v_x b4 set" << v_x << "v_y b4 set" << v_y << "dir" << dir << std::endl;
        v_forward = v_x * std::cos(dir) + v_y * std::sin(dir);
        w = (-std::sin(dir) * v_x + std::cos(dir) * v_y) / 150;
        std::cout << "v in set" << v_forward << "w in set" << w << std::endl;
    };
    float v_forward;
    float w;
    float vx;
    float vy;

    void collision(agents &agent) {
        // 定义mypos函数暂时存储机器人位置
        double mypos[5][2] = {0};
        int num = 5;
        double radius = 350;
        for (int i = 0; i < num; ++i) {
            mypos[i][0] = agent[i].x * 1000;
            mypos[i][1] = agent[i].y * 1000;
        }
        // rad_collsion为急停距离，小于该距离需要机器人立刻停止运动
        // radius为安全距离，即检测周围机器人的距离，超过该距离的机器人不用进行检测
        // 小于radius才需要进行检测
        double rad_collision = 200;
        for (int j = 0; j < num; ++j) {
            // 对每个机器热i的所有周围机器人进行探测（除了自己）
            // 定义两机器人的距离length
            double length = 0;
            int i = 0;
            length = sqrt(pow(mypos[i][0] - mypos[j][0], 2) + pow(mypos[i][1] - mypos[j][1], 2));
            cout << "Length:" << length << endl;
            if (length < 1e-3) {
                i = j;
                continue; // 说明该机器人j为自己}

                if ((length < radius) && (length > rad_collision)) {
                    // 机器人agent[i]与机器人j的距离过近，需要利用change函数修改机器人速度
                    change(agent[i], agent[j]);
                } else if (length < rad_collision) {
                    // 距离过近需要急停
                    cout << "Collsion:(" << i << "," << j << ")" << "length" << length << endl;
                    v_forward = 0;
                    w = 0;
                    agent[j].v_forward = 0;
                    agent[j].w = 0;
                }
            }
        }

        void change(agents &agi, agents &agj) {
            double alpha1 = 0.01, alpha2 = 3;
            double rad_collision = 100, radius = 750;
            double theta = agi.dir;
            double deltaj[2] = {0}, rj[2] = {0};
            double v_RRL[2] = {0}, v_RR[2] = {0};
            double neck = 150;

            // deltaj为机器人在世界坐标系下的相对位置
            deltaj[0] = agj.x - agi.x;
            deltaj[1] = agj.y - agi.y;
            // 坐标变化得到在机器人i的当地坐标系下的相对位置
            rj[0] = cos(theta) * deltaj[0] + sin(theta) * deltaj[1];
            rj[1] = -sin(theta) * deltaj[0] + cos(theta) * deltaj[1];
            // 机器人相对距离
            double norm_rj = sqrt(rj[0] * rj[0] + rj[1] * rj[1]);
            // 在机器人i的当地坐标系下需要修正的相对速度
            v_RRL[0] =
                    -alpha1 * rj[0] / norm_rj * ((1 / norm_rj - 1 / rad_collision) - (1 / radius - 1 / rad_collision)) -
                    alpha2 * rj[0] / norm_rj * (radius - norm_rj);
            v_RRL[1] =
                    -alpha1 * rj[1] / norm_rj * ((1 / norm_rj - 1 / rad_collision) - (1 / radius - 1 / rad_collision)) -
                    alpha2 * rj[1] / norm_rj * (radius - norm_rj);
            // 变换到世界坐标系下的相对速度
            v_RR[0] = cos(theta) * v_RRL[0] - sin(theta) * v_RRL[1];
            v_RR[1] = sin(theta) * v_RRL[0] + cos(theta) * v_RRL[1];
            // 对原有的速度进行修正
            agi.set_vel(agi.vx + v_RR[0] / 500, agi.vy + v_RR[1] / 10, agi.dir);
        }

    };

#endif /* AGENTS_H */<