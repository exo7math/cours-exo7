
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

n = 50
VX = np.linspace(-1.5, 1.5, n)
VY = np.linspace(-1.5, 1.5, n)
X,Y = np.meshgrid(VX, VY)

def f(x,y):  
    return x**2 + 2*y**2

Z = f(X,Y)


# Droite y = 2x-1
LX = np.linspace(-0.25, 1.25, n)
LY = 2*LX - 1
LZ = f(LX,LY)


# 
fig = plt.figure()
ax = plt.axes(projection='3d')
ax.set_xlabel('axe x')
ax.set_ylabel('axe y')
ax.set_zlabel('axe z')

ax.view_init(15, -70)
ax.view_init(35, -60)
ax.view_init(70, -75)

# Surface
ax.plot_surface(X, Y, Z, rstride=1, cstride=1, edgecolor='none',alpha=0.5)

# Courbe tracée sur la surface
ax.plot(LX, LY, LZ, color='orange', linewidth=5)
ax.plot(LX, LY, -0.2, color='red', linewidth=3)

#Tranche x = cst
# ax.plot_wireframe(X, Y, Z, color='blue', rstride=0, cstride=2) # x = cst

# Tranche y = cst
# ax.plot_wireframe(X, Y, Z, color='red', rstride=2, cstride=0)  # y = cst

# Courbes de niveaux
mes_niveaux = np.linspace(-0.1,2.5,11)
ax.contour(X, Y, Z, mes_niveaux, colors='gray',linestyles="solid")
# ax.contour(X, Y, Z, [-1], colors='black',linestyles="solid")
# ax.contour(X, Y, Z, [-0.05], colors='black',linestyles="solid")
# ax.contour(X, Y, Z, mes_niveaux, colors='black',linestyles="solid",offset=-10)
# ax.contour(X, Y, Z, [0.513], colors='black',linestyles="solid")
# ax.contour(X, Y, Z, [-0.05], colors='black',linestyles="solid",offset=-10)


plt.tight_layout()
# plt.savefig('fonctions-extremlie-1c.png')
plt.show()

# ligne de niveau dans le plan
# fig = plt.figure()
# plt.xlim(-2.0, 2.0)
# plt.ylim(-2.0, 2.0)
# mes_niveaux = np.linspace(0.1,3,10)
# plt.contour(X, Y, Z,mes_niveaux,colors='black')
# mes_niveaux = np.linspace(-3,-0.1,10)
# plt.contour(X, Y, Z,mes_niveaux,colors='black')
# plt.contour(X, Y, Z,[0],colors='black')
# plt.axis('equal') 

# plt.tight_layout()
# plt.savefig('fonctions-extrem-4.png')
# plt.show()

