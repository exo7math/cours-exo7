solutions = solve(x^2-x-1==0,x)
print(solutions)

var('phi,psi')
phi = solutions[1].rhs()
psi = solutions[0].rhs()
print('phi = ',phi,'   psi : ',psi)