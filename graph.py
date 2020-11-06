from agents import *
import numpy as np
import numpy.matlib
import random


class graph:
    def __init__(self):
        self.agents = []
        self.adjmatrix = np.matrix([[0]])
        self.center = position(0, 0)

    def addagent(self, p):
        a = agent(p)
        a.id = len(self.agents)
        self.agents.append(a)
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

    def controller(self, frame):
        center = position()
        for a in self.agents:
            center = center + a.coordinates
        center = center/len(self.agents)

        for a in self.agents:
            delta = a.coordinates-center
            if frame < 10:
                delta = delta * 0.9
            elif frame > 20 and frame < 30:
                delta = delta * 1.1
            a.coordinates = center+position(0.0, 0.0)+delta
