var('s,t')
x = t^3-2*t
y = t^2-t
eqx = x.subs(t=s) - x                  # Equation x(s)-x(t)
eqxs = (eqx/(s-t)).simplify_rational()  # (x(s)-x(t))/(s-t)
eqy = y.subs(t=s) - y                  # Equation y(s)-y(t)
eqys = (eqy/(s-t)).simplify_rational()  # (y(s)-y(t))/(s-t)
points_double = solve([eqxs==0,eqys==0], s,t)   # Solutions
