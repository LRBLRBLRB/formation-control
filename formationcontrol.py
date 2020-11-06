from agents import *
from graph import *
import numpy as np
import random

class control:
    def __init__(self):
        self.graph = graph()
        self.target = []
        
    def spawn(self,num,size):
        for i in range(num):
            self.graph.addagent(p=position(
                random.uniform(-size[0],size[0]), random.uniform(-size[1],size[1])))
            # add target
            a = agent(position(2*np.cos(i*np.pi*2/num),
                               2*np.sin(i*np.pi*2/num)))
            a.id = i
            self.target.append(a)

    def servo(self, target,delta,k1,k2):
        self.graph.connectivity(delta)
        for i in range(self.graph.agentcount):
            ag = self.graph.agents[i]
            neigh = self.graph.getneighbors(i)
            v = position(0,0)
            for n in neigh:
                v = v - ((ag.coordinates - n.coordinates) -
                         (target[ag.id].coordinates-target[n.id].coordinates))*k1
                v = v - (ag.coordinates-target[ag.id].coordinates)*k2
            ag.step(v)
        
    def printPos(self,size):
        if self.graph.agentcount > 0:
            print('leader pos x: ' + str(self.graph.agents[0].coordinates.x) + 'y: ' + str(
                self.graph.agents[0].coordinates.y))
        else:
            print('not initialized')
        pass
