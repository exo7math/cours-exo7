
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

n = 300
T = np.linspace(0, 2*np.pi, n)

def myx(t):  
	return np.sin(2*t)

def myy(t):  
	return np.sin(3*t)	

X = myx(T)
Y = myy(T)


# 
fig = plt.figure()
plt.plot(X,Y)
plt.axis('equal')
# plt.grid() 
plt.tight_layout()
plt.savefig('fonctions-intro-03.png', dpi=300)
plt.show()

