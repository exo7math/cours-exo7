# Graphe d'une sextique (courbe de degré 6)
x, y = var('x,y')
f = x^2*y^2-(x^2+y^2)^3
G = plot3d(f,(x,-1,1),(y,-1,1))
G.show()


# Surface d'Enneper
x, y, z = var('x,y,z')
a = 1
f = (a*(y^2-x^2)/(2*z)+2/9*z^2+2/3*a^2)^3-6*a^3*(a*(y^2-x^2)/(4*z)-1/4*(x^2+y^2+8/9*z^2)+2/9*a^2)^2
G = implicit_plot3d(f, (x,-3,3), (y,-3,3), (z,-2,2),plot_points=100, adaptative=True)
G.show()

# Nappes paramétrée
s,t = var('s,t')
G = parametric_plot3d([t^2*cos(s),s^2*sin(t),cos(t)+sin(t)],(s,0,1),(t,-pi,pi))
G.show(mesh=True)

# Coordonnées cylindriques
theta,z=var('theta,z')
G = cylindrical_plot3d(z^3*cos(theta),(theta,0,2*pi),(z,0,2))
G.show(mesh=True, dots = True)

# Coordonnées sphériques
theta, phi = var('theta, phi')
G = spherical_plot3d(theta*sin(2*phi),(theta,-1,2*pi),(phi,0,pi))
G.show(aspect_ratio=1)

