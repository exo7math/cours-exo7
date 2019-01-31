equadiff = x^2*yy == (x-1)*y
assume(x>0)
desolve(equadiff, y)
desolve(equadiff, y, ics=[1,2])
