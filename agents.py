import numpy as np
import random
from math import hypot

class position:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y
        self.length = hypot(self.x,self.y)

    def __sub__(self, other):
        return position(self.x-other.x, self.y-other.y)

    def __add__(self, other):
        return position(self.x + other.x, self.y + other.y)

    def __mul__(self, other):
        return position(self.x * other, self.y * other)

    def __truediv__(self, rhs):
        return position(self.x / rhs, self.y / rhs)

    def scaledown(self,scale):
        if scale>1:
            self.x = self.x/scale
            self.y = self.y/scale
        
class agent:
    def __init__(self, p=position()):
        self.id = 0
        self.coordinates = p

    def step(self, v):
        v.scaledown(v.length)
        #print(str(self.id)+'s vel length: '+str(v.length))
        self.coordinates = self.coordinates + v
