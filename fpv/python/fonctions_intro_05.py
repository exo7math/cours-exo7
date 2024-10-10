
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

n = 100
VU = np.linspace(-10.0, 10.0, n)
VV = np.linspace(-3.14, 3.14, n)
U,V = np.meshgrid(VU, VV)

# $ (u,v) \mapsto \left( (2+\sin(v))\cos(u), (2+\sin(v))\sin(u),u+\cos(v) \right)$

def myx(u,v):  
	return (2+np.cos(v))*np.cos(u)

def myy(u,v):  
	return (2+np.cos(v))*np.sin(u)

def myz(u,v):  
	return u+np.cos(v)

X = myx(U,V)
Y = myy(U,V)
Z = myz(U,V)


# 
fig = plt.figure()
ax = plt.axes(projection='3d')
ax.set_xlabel('axe x')
ax.set_ylabel('axe y')
ax.set_zlabel('axe z')
ax.view_init(30, 130)

# Surface
ax.plot_surface(X, Y, Z, cmap='coolwarm',  linewidth=0, antialiased=False, rstride=1, cstride=1, edgecolor='none',alpha=1)


plt.tight_layout()
# plt.savefig('fonctions-intro-05.png', dpi=300)
plt.show()

