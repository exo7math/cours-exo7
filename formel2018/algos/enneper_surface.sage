x, y, z = var('x,y,z'); a = 1
f = lambda x, y, z:(a*(y^2-x^2)/(2*z)+2/9*z^2+2/3*a^2)^3-6*a^3*(a*(y^2-x^2)/(4*z)-1/4*(x^2+y^2+8/9*z^2)+2/9*a^2)^2
p = implicit_plot3d(f, (x,-3,3), (y,-3,3), (z,-2,2),plot_points=100, adaptative=True)
p.show()
