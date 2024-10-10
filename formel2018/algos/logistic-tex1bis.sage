sage: t = var('t'); x = function('x')
sage: sol_impl = desolve(diff(x(t), t) == x(t)*(1-x(t))-1/8, [x(t),t], ics=[0, -0.1]); sol_impl
-sqrt(2)*log(-(sqrt(2) - 4*x(t) + 2)/(sqrt(2) + 4*x(t) - 2)) == -sqrt(2)*log(-47/(60*sqrt(2) - 97)) + t
sage: sol = solve(sol_impl,x(t)); sol
[x(t) == -1/4*((97*e^(1/2*sqrt(2)*t) + 47)*sqrt(2) - 120*sqrt(2)*e^(1/2*sqrt(2)*t) + 74*e^(1/2*sqrt(2)*t) - 94)/(60*sqrt(2)*e^(1/2*sqrt(2)*t) - 97*e^(1/2*sqrt(2)*t) + 47)]
sage: sol[0].rhs()
-1/4*((97*e^(1/2*sqrt(2)*t) + 47)*sqrt(2) - 120*sqrt(2)*e^(1/2*sqrt(2)*t) + 74*e^(1/2*sqrt(2)*t) - 94)/(60*sqrt(2)*e^(1/2*sqrt(2)*t) - 97*e^(1/2*sqrt(2)*t) + 47)
