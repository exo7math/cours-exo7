
# load("lagrange_two.sage")

# Exemple 5
f(x,y,z) = x^2 + y^2 + z^2
g1(x,y,z) = x^2 + y^2 - z^2
g2(x,y,z) = x + y - 2*z + 1


var('u v')  # lambda, mu
equations = [diff(f,x)-u*diff(g1,x)-v*diff(g2,x)==0, diff(f,y)-u*diff(g1,y)-v*diff(g2,y)==0, diff(f,z)-u*diff(g1,z)-v*diff(g2,z)==0, g1==0, g2==0]
solutions = solve(equations,(x,y,z,u,v))
# print(solutions)
# print([f.subs(sol).n() for sol in solutions])

# Exemple 6
f(x,y,z) = x^2 + y^2 + z^2
g1(x,y,z) = x^2 + y^2 - 4
g2(x,y,z) = 2*x + y + z - 2


var('u v')  # lambda, mu
equations = [diff(f,x)-u*diff(g1,x)-v*diff(g2,x)==0, diff(f,y)-u*diff(g1,y)-v*diff(g2,y)==0, diff(f,z)-u*diff(g1,z)-v*diff(g2,z)==0, g1==0, g2==0]
solutions = solve(equations,(x,y,z,u,v))
print(solutions)
print([f.subs(sol).n() for sol in solutions])