t = var('t')
g1 = polar_plot(1/sqrt(t),(t,0.1,12*pi),rgbcolor=hue(1))
g2 = polar_plot(-1/sqrt(t),(t,0.1,12*pi),rgbcolor=hue(0.1))
g = g1 + g2
g.show(aspect_ratio=1)
