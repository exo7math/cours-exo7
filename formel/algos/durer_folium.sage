var('t')
G = polar_plot(sin(t/2),(t,0,4*pi),plot_points=50000)
G.show(aspect_ratio=1, gridlines=True)
