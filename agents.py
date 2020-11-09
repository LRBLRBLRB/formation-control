import numpy as np
import random
from math import hypot, cos, sin, pi


class position:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y
        self.length = hypot(self.x, self.y)

    def __sub__(self, other):
        return position(self.x - other.x, self.y - other.y)

    def __add__(self, other):
        return position(self.x + other.x, self.y + other.y)

    def __mul__(self, other):
        return position(self.x * other, self.y * other)

    def __truediv__(self, rhs):
        return position(self.x / rhs, self.y / rhs)

    def scaledown(self, scale):
        if scale > 1:
            self.x = self.x/scale
            self.y = self.y / scale

    def show(self, id):
        print('Robot_id:' + str(id) + '(' + str(self.x) + ',' + str(self.y) + ')')


class agent:
    def __init__(self, p=position(), dir=0):
        self.id = 0
        self.coordinates = p  # as in meters
        self.direction = dir  # as in radian, x axis dir equal zero
        self.neck = 0.15
        self.head = self.coordinates + \
            position(self.neck*cos(self.direction),
                     self.neck * sin(self.direction))
        self.v = 0
        self.w = 0
        self.radius = 0.5

    def step(self, v, w, dt):
        # print(str(self.id)+'s vel length: '+str(v.length))
        self.coordinates.x = self.coordinates.x + \
            v*cos(self.direction)*dt
        self.coordinates.y = self.coordinates.y + \
            v*sin(self.direction)*dt
        self.direction = self.direction + w * dt

        while self.direction > pi:
            self.direction = self.direction-2*pi
        while self.direction < -pi:
            self.direction = self.direction+2*pi
        self.head = self.coordinates + \
            position(self.neck*cos(self.direction),
                     self.neck*sin(self.direction))
