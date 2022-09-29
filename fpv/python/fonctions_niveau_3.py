
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

n = 50
VX = np.linspace(-2.0, 2.0, n)
VY = np.linspace(-2.0, 2.0, n)
X,Y = np.meshgrid(VX, VY)

def f(x,y):  
	r = np.sqrt(x**2+y**2)
	z1 = np.sin(x**2+3*y**2)/(1/10+r**2)
	z2 = (x**2+5*y**2)*np.exp(1-r**2)/2
	z = z1 + z2
	return z

Z = f(X,Y)


# Contours et surface
fig = plt.figure()
ax = plt.axes(projection='3d')

plt.axis('off')

# # Hide grid lines
# ax.grid(False)

# # Hide axes ticks
# ax.set_xticks([])
# ax.set_yticks([])
# ax.set_zticks([])

# ax.set_xlabel('axe x')
# ax.set_ylabel('axe y')
# ax.set_zlabel('axe z')
ax.view_init(11, -25)
# ax.view_init(23, -45)


mes_niveaux = np.linspace(0,3,10)

# ax.plot_surface(X, Y, Z, rstride=1, cstride=1, cmap='coolwarm', edgecolor='none',alpha=0.9,linewidth=0, antialiased=False, rcount=200, ccount=200)
ax.plot_surface(X, Y, Z, cmap='coolwarm', linewidth=0, antialiased=False, rcount=100, ccount=100)

# ax.contour(X, Y, Z, zdir='z', offset=-100,colors='black')
# ax.contour(X, Y, Z, zdir='x', offset=-40,colors='black')
# ax.contour(X, Y, Z, zdir='y', offset=40,colors='black')
ax.contour(X, Y, Z, mes_niveaux, czdir='z', offset=-1,colors='gray', linestyles="solid",linewidths=0.5)
# ax.contour(X, Y, Z, mes_niveaux, czdir='z', offset=4,colors='black', linestyles="solid",linewidths=1)


plt.tight_layout()
# plt.savefig('fonctions-niveau-3a.png', dpi=300)
plt.show()

# ligne de niveau dans le plan
fig = plt.figure()
plt.xlim(-2.0, 2.0)
plt.ylim(-2.0, 2.0)
plt.contour(X, Y, Z,mes_niveaux,colors='black')
plt.axis('equal') 

# plt.tight_layout()
# plt.savefig('fonctions-niveau-3b.png', dpi=300)
# plt.show()

