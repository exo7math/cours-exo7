t = var('t')
x = cos(t)^2
y = cos(t)*sin(t)
z = sqrt((1-cos(t))*cos(t))
g1 = parametric_plot((x, y, z), (t, -pi/2, pi/2), color = 'red',thickness=5, plot_points=1000)
g2 = parametric_plot((x, y, -z), (t, -pi/2, pi/2), color = 'red',thickness=5, plot_points=1000)
g = g1 + g2
g.show()
