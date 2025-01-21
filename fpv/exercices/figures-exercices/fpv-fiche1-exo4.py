
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

n = 50
VX = np.linspace(-3.0, 3.0, n)
VY = np.linspace(-3.0, 3.0, n)
X,Y = np.meshgrid(VX, VY)

def f(x,y):  
    if x**2-2*y < 0:
        return 0
    else:
        return np.sqrt(x**2-2*y)
    
def vecf(x,y):
    return np.vectorize(f)(x,y)

Z = vecf(X,Y)


# 3D graph
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.plot_surface(X, Y, Z, rstride=2, cstride=2, cmap='viridis')

# ax.view_init(22, 150)
ax.view_init(15, -45)

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
# plt.savefig('fpv-fiche1-exo4-fig2.png', dpi=300)
plt.tight_layout()
plt.show()


