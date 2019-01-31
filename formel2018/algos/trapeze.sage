f1(x) = x^3-x+1/(10*(1+x**2))
f = Piecewise([[(-1,1),f1]])
int=f.integral(definite=True)
int
1/20*pi
sage: N(int)
0.157079632679490
int_app=f.trapezoid_integral_approximation(6)
int_app
203/1300
sage: N(int_app)
0.156153846153846
g = f.trapezoid(6)
integrate(g, x, -1, 1)
203/1300
N(integrate(g, x, -1, 1))
0.156153846153846
Cf=plot(f, color='red')
Cg=plot(g, fill='axis')
show(Cf+Cg)
