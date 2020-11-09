import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np
from agents import *
from graph import *
import random
from formationcontrol import *


class magui:
    def __init__(self, figsize=[5, 5]):
        self.resolution = 1
        self.size = figsize
        self.fig = plt.figure()
        self.ax = self.fig.add_subplot(111)
        self.ax.set_aspect(1)
        self.ax.set_xlim([-self.size[0], self.size[0]])
        self.ax.set_ylim([-self.size[1], self.size[1]])
        self.formation = control()
        self.formation.spawn(5, self.size)

    def initAnimation(self):
        x = []
        y = []
        for i in range(self.formation.graph.agentcount):
            x.append(float(self.formation.graph.agents[i].coordinates.x))
            y.append(float(self.formation.graph.agents[i].coordinates.y))
        print(str(x) + ',' + str(y))
        self.aniagents, = self.ax.plot(x, y, 'ro', ms=4)

        xh=[]
        yh=[]
        for i in range(self.formation.graph.agentcount):
            xh.append(float(self.formation.graph.agents[i].head.x))
            yh.append(float(self.formation.graph.agents[i].head.y))

        self.aniagentshead, = self.ax.plot(xh, yh, 'bo', ms=2)
        self.linc, = self.ax.plot([])
        return self.aniagents, self.linc, self.aniagentshead,

    def updateAnimation(self, frame):
        self.formation.servo(self.formation.target, delta=10, k1=0.2, k2=0.3)
        self.formation.printPos(self.size)
        x = [a.coordinates.x for a in self.formation.graph.agents]
        y = [a.coordinates.y for a in self.formation.graph.agents]
        xh = [a.head.x for a in self.formation.graph.agents]
        yh = [a.head.y for a in self.formation.graph.agents]
        size = self.formation.graph.adjmatrix.shape
        xsegs = []
        ysegs = []
        for i in range(size[0]):
            for j in range(size[1]):
                if self.formation.graph.adjmatrix[i, j] == 1:
                    xsegs.append([self.formation.graph.agents[i].coordinates.x,
                                  self.formation.graph.agents[j].coordinates.x])
                    ysegs.append([self.formation.graph.agents[i].coordinates.y,
                                  self.formation.graph.agents[j].coordinates.y])
        self.aniagentshead.set_data(xh, yh)
        self.aniagents.set_data(x, y)
        self.linc.set_data(xsegs, ysegs)
        return self.aniagents, self.linc, self.aniagentshead,

    def animate(self):
        ani = animation.FuncAnimation(self.fig, self.updateAnimation, frames=range(
            0, 1000), init_func=self.initAnimation, interval=100, blit=True)
        plt.show()


if __name__ == "__main__":
    mademo = magui()
    mademo.animate()
