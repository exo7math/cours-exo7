t = var('t'); x = function('x')
tsup = 1
xinf = -0.5
xsup = 1.5
c = 1/8
DE = diff(x(t), t) == x(t)*(1-x(t))-c
g = Graphics()
for i in srange(-0.1, 1.2, 1/10):
    sol_impl = desolve(DE, [x(t),t], ics=[0,i])
    sol = solve(sol_impl,x(t))
    g += plot(sol[0].rhs(), (t, 0, tsup))

