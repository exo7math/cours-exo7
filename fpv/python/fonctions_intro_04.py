
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


n = 300
T = np.linspace(0, 6*np.pi, n)

def myx(t):  
	return np.cos(t)

def myy(t):  
	return np.sin(t)	

def myz(t):  
	return t

X = myx(T)
Y = myy(T)
Z = myz(T)

# 
fig = plt.figure()
ax = plt.axes(projection='3d')
ax.set_xlabel('axe x')
ax.set_ylabel('axe y')
ax.set_zlabel('axe z')
ax.view_init(20, 125)

# Surface
ax.plot(X, Y, Z)


plt.tight_layout()
# plt.savefig('fonctions-intro-04.png', dpi=300)
plt.show()

