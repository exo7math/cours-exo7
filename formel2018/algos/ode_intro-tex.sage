t = var('t'); x = function('x')
desolve(diff(x(t),t) == x(t)+t+1, x(t))
-((t + 1)*e^(-t) - c + e^(-t))*e^t
sage: desolve(diff(x(t),t) == x(t)+t+1, x(t), ics=[0,1])
-t + 3*e^t - 2
