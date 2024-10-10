# Pour le chapitre
plot3d(cos(x*y),(x,-4,4),(y,-4,4))



# En vrai
f(x,y) = cos(x*y)
G = plot3d(f,(-4,4),(-4,4), adaptive=True, color=rainbow(60, 'rgbtuple'), max_bend=.1, max_depth=15)
G.show()

f(x) = cos(x)
G = plot(f,(-3,3))
G.show()


# Pour le chapitre

f = exp(x)*sin(x)
T1 = taylor(f,x,0,1)
T2 = taylor(f,x,0,2)
T3 = taylor(f,x,0,3)
plot([f,T1,T2,T3],(-3,3))




# En vrai

f(x) = exp(x)*sin(x)
T1 = taylor(f(x),x,0,1)
T2 = taylor(f(x),x,0,2)
T3 = taylor(f(x),x,0,3)
T4 = taylor(f(x),x,0,4)
T5 = taylor(f(x),x,0,5)
G =  plot(f,(-3,3), color='black',thickness=2)+text('$f$', (3,5), color='black')
G = plot(T1,(-3,3), color='red')+text('$T_1$', (3,2), color='red')
G = G + plot(T2,(-3,3), color='green')+text('$T_2$', (3,10), color='green')
G = G + plot(T3,(-3,2.3), color='blue')+text('$T_3$', (2.5,12), color='blue')
G = G + plot(f,(-3,3), color='black',thickness=2)+text('$f$', (3,5), color='black')
G.show()


# Lissajou pour de vrai
parametric_plot((cos(3*x),sin(4*x)),(x,0,2*pi), fill=True)

# Lissajou chapitre
parametric_plot((cos(3*x),sin(4*x)),(x,0,2*pi))

# Divers
p1 = plot(sin(x), -pi, pi, fill = 'axis')
p2 = plot(sin(x), -pi, pi, fill = 'min')
p3 = plot(sin(x), -pi, pi, fill = 'max')
p4 = plot(sin(x), -pi, pi, fill = 0.5)
graphics_array([[p1, p2], [p3, p4]]).show(frame=True, axes=False)

parametric_plot([cos(x) + 2 * cos(x/4), sin(x) - 2 * sin(x/4)], (x,0, 8*pi), fill = True)


# Mini-exercices
var('t,X,Y')
X = sin(t)*(exp(cos(t)) - 2.0*cos(4.0*t) - pow(sin(t/12.0),5.0))
Y = cos(t)*(exp(cos(t)) - 2.0*cos(4.0*t) - pow(sin(t/12.0),5.0))
parametric_plot([X,Y], (t,0,120*pi))


f(x,y) = y*exp(-x^2-y^2)
plot3d(f,(-4,4),(-4,4), adaptive=True, color=rainbow(60, 'rgbtuple'), max_bend=.1, max_depth=15)