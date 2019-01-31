
# Courbes de y' = -xy

# Resolution de l'équation
t = var('t')
x = function('x',t)

k = 1
m = 1

tmin = 0
tmax = 10


# Sans frottement
f = 0
sol = desolve(diff(x,t,2) + f*diff(x,t) + k/m*x(t) == 0, x, ics=[0,1,0])
print(sol)

G = Graphics()
G = G + plot(sol, (t, tmin, tmax))
G.show()
G.save('equadiff-ressort1.png')

# Frottements faibles
f = 1
sol = desolve(diff(x,t,2) + f*diff(x,t) + k/m*x(t) == 0, x, ics=[0,1,0])
print(sol)

G = Graphics()
G = G + plot(sol, (t, tmin, tmax))
G.show()
G.save('equadiff-ressort2.png')

# Frottements faibles
f = 2
sol = desolve(diff(x,t,2) + f*diff(x,t) + k/m*x(t) == 0, x, ics=[0,1,0])
print(sol)

G = Graphics()
G = G + plot(sol, (t, tmin, tmax))
G.show()
G.save('equadiff-ressort3.png')

#G = Graphics()
#for f in srange(0,2.4, 0.2):
    #sol = desolve(diff(x,t,2) + f*diff(x,t) + k/m*x(t) == 0, x, ics=[0,1,0])
    #print(sol)
    #print(solve(sol == 0, t))
    #G = G + plot(sol, (t, tmin, tmax))
#G.show()



