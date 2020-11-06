import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np
from agents import *
from graph import *
import random


class magui:
    def __init__(self, figsize=[10, 10]):
        self.resolution = 1
        self.size = figsize
        self.agents = []
        self.fig = plt.figure()
        self.ax = self.fig.add_subplot(111)
        self.ax.set_xlim([0, self.size[0]])
        self.ax.set_ylim([0, self.size[1]])
        self.graph = graph()
        self.graph.addagent(p=position(random.random(), random.random()+3))
        self.graph.addagent(p=position(random.random()+0.5, random.random()+3))
        self.graph.addagent(p=position(random.random()+1, random.random()+4))
        self.graph.addagent(p=position(random.random()+1, random.random()+4))
        self.graph.connect(0, 1)
        self.graph.connect(1, 2)
        self.graph.connect(2, 3)
        self.graph.connect(0, 3)

    def initAnimation(self):
        x = [a.coordinates.x for a in self.graph.agents]
        y = [a.coordinates.y for a in self.graph.agents]
        self.aniagents, = self.ax.plot(x, y, 'ro', ms=8)
        self.linc, = self.ax.plot([])
        return self.aniagents, self.linc,

    def updateAnimation(self, frame):
        center = position()
        for a in self.graph.agents:
            center = center + a.coordinates
        center = center/len(self.graph.agents)

        for a in self.graph.agents:
            delta = a.coordinates-center
            if frame < 10:
                delta = delta * 0.9
            elif frame > 20 and frame < 30:
                delta = delta * 1.1
            a.coordinates = center+position(0.05, 0.05)+delta
        x = [a.coordinates.x for a in self.graph.agents]
        y = [a.coordinates.y for a in self.graph.agents]
        size = self.graph.adjmatrix.shape
        xsegs = []
        ysegs = []
        for i in range(size[0]):
            for j in range(size[1]):
                if self.graph.adjmatrix[i, j] == 1:
                    xsegs.append([self.graph.agents[i].coordinates.x,
                                  self.graph.agents[j].coordinates.x])
                    ysegs.append([self.graph.agents[i].coordinates.y,
                                  self.graph.agents[j].coordinates.y])
        self.aniagents.set_data(x, y)
        self.linc.set_data(xsegs, ysegs)
        return self.aniagents, self.linc,

    def animate(self):
        self.agents.append(agent(p=position(random.random())))
        ani = animation.FuncAnimation(self.fig, self.updateAnimation, frames=range(
            0, 1000), init_func=self.initAnimation, interval=500, blit=True)
        plt.show()


if __name__ == "__main__":
    mademo = magui()
    mademo.animate()
