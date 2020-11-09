from agents import *
from graph import *
import numpy as np
import random
import math
from math import pi, atan2


class control:
    def __init__(self):
        self.graph = graph()
        self.target = []

    def spawn(self, num, size):
        for i in range(num):
            # self.graph.addagent(p=position(random.uniform(-size[0], size[0]), random.uniform(-size[1], size[1])), dir=random.uniform(-pi, pi))
            self.graph.addagent(p=position(i / 3, 1 / 5 * math.pow(-1, i)), dir=pi / 2 * math.pow(-1, i) + pi / 2)
            # add target
            # a = agent(position(2*np.cos(i*np.pi*2/num),
            #                    2*np.sin(i*np.pi*2/num)))
            a = agent(position(i - 4.5, 0), 0)
            a.id = i
            self.target.append(a)

    def servo(self, target, delta, k1, k2):
        # self.graph.connectivity(delta)
        # for i in range(self.graph.agentcount):
        #     ag = self.graph.agents[i]
        #     v = position(0, 0)
        #     neigh = self.graph.getneighbors(i)
        #     for n in neigh:
        #         v = v - ((ag.coordinates - n.coordinates) -
        #                  (target[ag.id].coordinates-target[n.id].coordinates))*k1
        #     # v = target[ag.id].coordinates-ag.coordinates
        #     v_forward = v.x*cos(ag.direction)+v.y*sin(ag.direction)
        #     w = (-sin(ag.direction)*v.x+cos(ag.direction)*v.y)/ag.neck*k2
        #     print('w' + str(w))
        #     print('dir' + str(ag.direction))
        #     print('dird' + str(target[ag.id].direction))

        #     print('v_forward' + str(v_forward))
        #     print('x: '+str(ag.coordinates.x)+'y: '+str(ag.coordinates.y))
        #     print('xd: '+str(target[ag.id].coordinates.x) +
        #           'yd: '+str(target[ag.id].coordinates.y))
        #     ag.step(v_forward, w, 0.05)  # 0.05s

        # 计算拉普拉斯矩阵，利用一致性协议进行下一步的计算，只控制x坐标一致
        xd = np.mat(np.ones((self.graph.agentcount, 1)))
        for i in range(self.graph.agentcount):
            ag = self.graph.agents[i]
            xd[i] = ag.coordinates.x
        l = self.graph.agentcount * \
            np.mat(np.eye(self.graph.agentcount, self.graph.agentcount)) - \
            np.mat(np.ones((self.graph.agentcount, self.graph.agentcount)))
        xout = -l * xd

        # 将x方向的速度进行转换，转换为机器人运动的v_forward以及w
        for i in range(self.graph.agentcount):
            v = position(0, 0)
            v.x = xout[i]
            ag = self.graph.agents[i]
            v_forward, w = vxy2vw(v, ag.direction, ag.neck)
            # ag.step(v_forward * k1, w * k2, 0.05)
            ag.v = v_forward
            ag.w = w

        # 对计算出的v_forward以及w进行碰撞检测并修正速度
        self.collision(0.05)

        # 发送指令控制机器人前进
        for j in range(self.graph.agentcount):
            # ag.step(v_forward * k1, w * k2, 0.05)
            ag = self.graph.agents[j]
            ag.step(ag.v * k1, ag.w * k2, 0.05)

    def printPos(self, size):
        if self.graph.agentcount > 0:
            print('leader pos x: ' + str(self.graph.agents[0].coordinates.x) + 'y: ' + str(
                self.graph.agents[0].coordinates.y) + 'dir: ' + str(self.graph.agents[0].direction))
        else:
            print('not initialized')
        pass

    def collision(self, dt=0.05):

        # 碰撞检测,先计算下一时刻的位置，用mypos存储
        mypos = []
        nextpos = position()
        num = self.graph.agentcount
        radius = self.graph.agents[0].radius
        for i in range(num):
            ag = self.graph.agents[i]
            mypos.append(position(
                ag.coordinates.x + ag.v * cos(ag.direction) * dt,
                ag.coordinates.y + ag.v * sin(ag.direction) * dt
            ))
            # 显示当前各个机器人姿态
            mypos[i].show(i)

        # D为距离矩阵（上三角），判断两机器人是否过于接近，若是则用change函数改变机器人的v_forward以及w
        col_id = []
        D = np.zeros((num, num))
        rad_collison = 0.15
        for i in range(num - 1):
            for j in range(num - 1):
                # 不对自身进行碰撞检测
                if j == i:
                    continue

                # 计算世界坐标系下两机器人的位置，记录进距离矩阵D
                temp = mypos[i] - mypos[j]
                D[i, j] = temp.length
                if (temp.length < radius) and (temp.length > rad_collison):
                    # 距离处于斥力区，需要对速度修正
                    col_id.append([i, j])
                    df = radius
                    # print('Near:(' + str(i) + ',' + str(j) + ')')
                    self.change(i, j, rad_collison, df)
                elif temp.length < rad_collison:
                    # 距离小于rad_collision，机器人急停
                    print('Collison:(' + str(i) + ',' + str(j) + ')' + 'Too close!Dis:' + str(temp.length))
                    self.graph.agents[i].v = 0
                    self.graph.agents[j].w = 0
                    self.graph.agents[i].v = 0
                    self.graph.agents[j].w = 0

    def change(self, i, j, rad_collision, df):
        alpha1 = 4
        alpha2 = 3

        agi = self.graph.agents[i]
        agj = self.graph.agents[j]

        theta = float(agi.direction)

        Rotate = np.array([[math.cos(theta), -math.sin(theta)],
                           [math.sin(theta), math.cos(theta)]])

        deltaj = np.array([float(agj.coordinates.x - agi.coordinates.x),
                           float(agj.coordinates.y - agi.coordinates.y)])
        rj = np.dot(np.transpose(Rotate), deltaj)
        norm_rj = np.linalg.norm(rj)
        v_RRL = -alpha1 * rj / norm_rj * ((1 / norm_rj - 1 / rad_collision) - (1 / df - 1 / rad_collision)) - \
                alpha2 * rj / norm_rj * (df - norm_rj)
        v_RR = np.dot(Rotate, v_RRL)

        cor_v, cor_w = vxy2vw(position(v_RR[0], v_RR[1]), theta, agi.neck)
        gain = 1
        # print('correct:(' + str(cor_v) + ',' + str(cor_w) + ')')
        agi.v = agi.v + cor_v * gain
        agi.w = agi.w + cor_w * gain

    def change2(self, i, j, rad_collision, df):
        alpha = 0.5
        agi = self.graph.agents[i]
        agj = self.graph.agents[j]
        deltaj = np.array([float(agj.coordinates.x - agi.coordinates.x),
                           float(agj.coordinates.y - agi.coordinates.y)])
        norm_rj = np.linalg.norm(deltaj)

        ex = 5
        cor_v = position(deltaj[0] / pow(norm_rj, ex) * alpha, deltaj[1] / pow(norm_rj, ex) * alpha)

        cor_vi, cor_wi = vxy2vw(position(-cor_v.x, -cor_v.y), agi.direction, agi.neck)
        agi.v = agi.v + cor_vi
        agi.w = agi.w + cor_wi

        cor_vj, cor_wj = vxy2vw(cor_v, agj.direction, agj.neck)
        agj.v = agj.v + cor_vj
        agj.w = agj.w + cor_wj


def vxy2vw(v, dir, neck):
    v_forward = v.x * cos(dir) + v.y * sin(dir)
    w = (-sin(dir) * v.x + cos(dir) * v.y) / neck
    return v_forward, w
