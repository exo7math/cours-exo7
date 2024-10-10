var('s,t')
x = t^3-2*t
y = t^2-t
exprx = x.subs(t=s) - x                     # Expression x(s)-x(t)
exprx = (exprx/(s-t)).simplify_rational()   # (x(s)-x(t))/(s-t)
eqx = exprx == 0                            # Équation (x(s)-x(t))/(s-t) = 0
expry = y.subs(t=s) - y                     # Expression y(s)-y(t)
expry = (expry/(s-t)).simplify_rational()   # (y(s)-y(t))/(s-t)
eqy = expry == 0                            # Équation (y(s)-y(t))/(s-t) = 0
points_double = solve([eqx, eqy], s, t)     # Solutions
