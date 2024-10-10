equil = solve(x*(1-x)-c, x)
g += line([(0,equil[0].rhs()), (tsup,equil[0].rhs())], rgbcolor=(1, 0, 0))
g += line([(0,equil[1].rhs()), (tsup,equil[1].rhs())], rgbcolor=(1, 0, 0))
