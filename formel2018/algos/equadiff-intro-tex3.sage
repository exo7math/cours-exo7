equadiff = yy == y*(1-y) - 1
sol_impl = desolve(equadiff, y)
sol = solve(sol_impl,y)