
import numpy as np
import matplotlib.pyplot as plt

n = 20
VX = np.linspace(-2.0, 2.0, n)
VY = np.linspace(-2.0, 2.0, n)
X,Y = np.meshgrid(VX, VY)

def f(x,y):  
	z = x*np.sqrt(np.exp(-x**2 - y**2))
	return z

Z = f(X,Y)
V, U = np.gradient(Z, .25, .25)

q = plt.quiver(X, Y, U, V)

# plt.quiverkey(q, X=0.3, Y=1.1, U=10, label='Quiver key, length = 10', labelpos='E')

plt.axis('equal') 
# plt.axis('off')
plt.tight_layout()

# plt.savefig('fonctions-intro-06.png', dpi=300)
plt.show()

