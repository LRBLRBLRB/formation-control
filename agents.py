import numpy as np
import random

class position:
    def __init__(self,x=0,y=0):
        self.x = x
        self.y = y

    def __sub__(self,other):
        return position(self.x-other.x,self.y-other.y)

    def __add__(self, other):
        return position(self.x + other.x, self.y + other.y)

    def __mul__(self, other):
        return position(self.x * other, self.y * other)

    def __div__(self, other):
        return position(self.x / other, self.y / other)


class agent:
    def __init__(self, p=position()):
        self.id = 0
        self.coordinates = p

    def step(self,v):
        self.coordinates.x =self.coordinates.x + v[0]
        self.coordinates.y =self.coordinates.y + v[1]
