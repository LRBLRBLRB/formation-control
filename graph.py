from agents import *
import numpy as np
import numpy.matlib
import random


class graph:
    def __init__(self):
        self.agents = []
        self.adjmatrix = np.matrix([[0]])

    def addagent(self, p):
        a = agent(p)
        a.id = len(self.agents)
        self.agents.append(a)
        self.agentcount = len(self.agents)
        if(a.id < 1):
            self.adjmatrix = np.matrix([[0]])
        else:
            size = self.adjmatrix.shape
            col = numpy.matlib.zeros((size[0], 1))
            row = numpy.matlib.zeros((1, size[1]+1))

            self.adjmatrix = np.c_[self.adjmatrix, col]
            self.adjmatrix = np.r_[self.adjmatrix, row]

    def connect(self, i, j, conect=True):
        if(conect):
            self.adjmatrix[i, j] = 1
            self.adjmatrix[j, i] = 1
        else:
            self.adjmatrix[i, j] = 0
            self.adjmatrix[j, i] = 0

    def connectivity(self, delta=1):
        for i in range(self.agentcount):
            for j in range(self.agentcount):
                dis = (self.agents[i].coordinates - self.agents[j].coordinates)
                dis = np.linalg.norm([dis.x, dis.y])
                if dis < delta and dis > 0:
                    self.adjmatrix[i, j] = 1
                    self.adjmatrix[j, i] = 1
                else:
                    self.adjmatrix[i, j] = 0
                    self.adjmatrix[j, i] = 0

    def getneighbors(self, id):
        neigh = []
        for i in range(self.agentcount):
            if self.adjmatrix[id, i] == 1:
                neigh.append(self.agents[i])
        return neigh
