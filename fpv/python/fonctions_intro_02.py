
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

n = 100
VX = np.linspace(-3.0, 3.0, n)
VY = np.linspace(-3.0, 3.0, n)
X,Y = np.meshgrid(VX, VY)

def f(x,y):  
	z = np.sin(x*y)
	return z

Z = f(X,Y)


# 
fig = plt.figure()
ax = plt.axes(projection='3d')
ax.set_xlabel('axe x')
ax.set_ylabel('axe y')
ax.set_zlabel('axe z')
ax.view_init(30, 110)

# Surface
ax.plot_surface(X, Y, Z, cmap='coolwarm',  linewidth=0, antialiased=False, rstride=1, cstride=1, edgecolor='none',alpha=1)


plt.tight_layout()
# plt.savefig('fonctions-intro-02.png', dpi=300)
plt.show()

