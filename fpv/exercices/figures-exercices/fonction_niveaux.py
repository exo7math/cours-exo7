
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D



n = 100
VX = np.linspace(-3.0, 3.0, n)
VY = np.linspace(-3.0, 3.0, n)
X,Y = np.meshgrid(VX, VY)

def f(x,y):  
	return -1/3*x**3 - x*y - y**2 + x + 3/2

Z = f(X,Y)

mes_niveaux = np.arange(-1,3,0.50)

# ligne de niveau dans le plan
fig, ax = plt.subplots()
plt.rcParams['contour.negative_linestyle'] = 'solid'


# CS = plt.contour(X, Y, Z, mes_niveaux, colors='black')

# ax.clabel(CS, inline=True, fontsize=10)


# mes_niveaux = np.arange(-0.75,3,0.25)

# ligne de niveau dans le plan

# plt.contour(X, Y, Z, mes_niveaux, colors='grey')

# plt.xlim(-3.0, 3.0)
# plt.ylim(-3.0, 3.0)

# plt.axis('equal') 
# plt.tight_layout()
# plt.savefig('fonction-niveaux.png', dpi=300)
# plt.show()


# Correction : figure 3D
n = 50
VX = np.linspace(-2.5, 2.8, n)
VY = np.linspace(-2.8, 1.8, n)
X,Y = np.meshgrid(VX, VY)


Z = f(X,Y)
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
# label sur les axes
ax.set_xlabel('x')
ax.set_ylabel('y')
ax.set_zlabel('z')
# set the viewing angle
ax.view_init(13, -67)
ax.plot_surface(X, Y, Z, cmap='viridis')
plt.tight_layout()
# plt.savefig('fonction-niveaux-3D.png', dpi=300)
plt.show()


