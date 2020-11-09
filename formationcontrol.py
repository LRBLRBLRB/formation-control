from agents import *
from graph import *
import numpy as np
import random
from math import pi, atan2


class control:
    def __init__(self):
        self.graph = graph()
        self.target = []

    def spawn(self, num, size):
        for i in range(num):
            self.graph.addagent(p=position(
                random.uniform(-size[0], size[0]), random.uniform(-size[1], size[1])), dir=random.uniform(-pi, pi))
            # add target
            # a = agent(position(2*np.cos(i*np.pi*2/num),
            #                    2*np.sin(i*np.pi*2/num)))
            a = agent(position(i-4.5, 0), 0)
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
        xd = np.mat(np.ones((self.graph.agentcount, 1)))
        for i in range(self.graph.agentcount):
            ag = self.graph.agents[i]
            xd[i] = ag.coordinates.x
        l = self.graph.agentcount * \
            np.mat(np.eye(self.graph.agentcount, self.graph.agentcount)) - \
            np.mat(np.ones((self.graph.agentcount, self.graph.agentcount)))
        xout = -l * xd
        for i in range(self.graph.agentcount):
            v = position(0, 0)
            v.x = xout[i]
            ag = self.graph.agents[i]
            v_forward, w = vxy2vw(v, ag.direction, ag.neck)
            ag.step(v_forward*k1, w*k2, 0.05)
        self.collision(0.05)

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

            mypos[i].show(i)

        col_id = []
        D = np.zeros((num, num))
        for i in range(num - 1):
            for j in range(i + 1, num - 1):
                temp = mypos[i] - mypos[j]
                D[i, j] = temp.length
                if temp.length < radius:
                    col_id.append([i, j])
                    print('(' + str(i) + ',' + str(j) + ')')
                    self.change(i, j)

    def change(self, i, j):
        pass
        # self.graph.agents[i].v = -self.graph.agents[i].v
        # self.graph.agents[j].v = -self.graph.agents[j].v


def vxy2vw(v, dir, neck):
    v_forward = v.x*cos(dir)+v.y*sin(dir)
    w = (-sin(dir) * v.x + cos(dir) * v.y) / neck
    return v_forward, w
