from scipy.integrate import simps
import numpy as np
def f(x):
    return x*sin(x)+x+1
x = np.arange(-3,4,dtype=float)*10/3
print(x)
[-10.        -6.66666667  -3.33333333   0.  3.33333333 6.66666667  10.        ]
y = f(x)
I = simps(y,x)
print(I)
27.2593376752
