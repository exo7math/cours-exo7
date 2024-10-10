f(x,y) = x^6 + y^6 - x^2
G = implicit_plot(f, (x,-1.2, 1.2), (y,-1.2, 1.2))
G.show(aspect_ratio=1)
G.save('butterfly_curve_algebraic.png',aspect_ratio=1)
