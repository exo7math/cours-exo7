
# load("lagrange_one.sage")

# Exemple 1

var('x y')
f(x,y) = x^2 + 2*y^2
g(x,y) = y -2*x + 1

var('u')  # lambda
equations = [diff(f,x)-u*diff(g,x)==0, diff(f,y)-u*diff(g,y)==0, g==0]
solutions = solve(equations,(x,y,u))
# print(solutions)


# Exemple 2

var('x y')
f(x,y) = (x-2)^2 + (y-1)^2
g(x,y) = y + x^2

var('u')  # lambda
equations = [diff(f,x)-u*diff(g,x)==0, diff(f,y)-u*diff(g,y)==0, g==0]
solutions = solve(equations,(x,y,u))
# print(solutions)
var('x y z')


# Exemple 3
f(x,y,z) = x^2 + y^2 + z^2
g(x,y,z) = x + 2*y + 3*z - 1

var('u')  # lambda
equations = [diff(f,x)-u*diff(g,x)==0, diff(f,y)-u*diff(g,y)==0, diff(f,z)-u*diff(g,z)==0, g==0]
solutions = solve(equations,(x,y,z,u))
print(solutions)


# Exemple 4
f(x,y,z) = x + 2*y + 3*z
g(x,y,z) = x^2 + y^2 + z^2 - 1

var('u')  # lambda
equations = [diff(f,x)-u*diff(g,x)==0, diff(f,y)-u*diff(g,y)==0, diff(f,z)-u*diff(g,z)==0, g==0]
solutions = solve(equations,(x,y,z,u))
# print(solutions)

