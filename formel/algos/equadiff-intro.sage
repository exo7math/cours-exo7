
# Equadiff 1
var('x')
y = function('y',x)
yy = diff(y,x)
print(desolve(yy == y+x+1, y))
print(desolve(yy == y+x+1, y, ics=[0,1]))


# Equadiff 2
x = var('x')
y = function('y',x)
yy = diff(y,x)
equadiff = x^2*yy == (x-1)*y
print(desolve(equadiff, y))
forget()
assume(x>0)
print(desolve(equadiff, y))
print(desolve(equadiff, y, ics=[1,2]))
forget()
assume(x<0)
print(desolve(equadiff, y))

forget()


# Fonction logistique
x = var('x')
y = function('y',x)
yy = diff(y,x)
equadiff = yy == y*(1-y) - 1
sol_impl = desolve(equadiff, y)
#sol_impl = desolve(equadiff, y, ics = [0,-1])
print(sol_impl)
sol = solve(sol_impl,y)
print(sol[0].rhs())
