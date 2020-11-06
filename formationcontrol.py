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
            a = agent(position(2*np.cos(i*np.pi*2/num),
                               2*np.sin(i*np.pi*2/num)))
            # a = agent(position(i, 0), 0)
            a.id = i
            self.target.append(a)

    def servo(self, target, delta, k1, k2):
        self.graph.connectivity(delta)
        for i in range(self.graph.agentcount):
            ag = self.graph.agents[i]
            #neigh = self.graph.getneighbors(i)
            vect = target[ag.id].coordinates-ag.coordinates
            v_forward = vect.length*k1
            # w = -(ag.direction-target[ag.id].direction) * \
            #     10 + atan2(vect.y, vect.x)
            w = (atan2(vect.y, vect.x)-ag.direction) * k2
            # for n in neigh:
            #     v = v - ((ag.coordinates - n.coordinates) -
            #              (target[ag.id].coordinates-target[n.id].coordinates))*k1
            # v_forward = v_forward + \
            #     (v.x*cos(ag.direction)+v.y*sin(ag.direction))
            print('w' + str(w))
            print('dir' + str(ag.direction))
            print('dird' + str(target[ag.id].direction))

            print('v_forward' + str(v_forward))
            print('x: '+str(ag.coordinates.x)+'y: '+str(ag.coordinates.y))
            print('xd: '+str(target[ag.id].coordinates.x) +
                  'yd: '+str(target[ag.id].coordinates.y))
            ag.step(v_forward, w, 0.05)  # 0.05s

    def printPos(self, size):
        if self.graph.agentcount > 0:
            print('leader pos x: ' + str(self.graph.agents[0].coordinates.x) + 'y: ' + str(
                self.graph.agents[0].coordinates.y) + 'dir: ' + str(self.graph.agents[0].direction))
        else:
            print('not initialized')
        pass
