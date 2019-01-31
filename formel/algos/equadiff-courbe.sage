
# Courbes de y' = -xy

# Resolution de l'équation
x = var('x')
y = function('y',x)
yy = diff(y,x)
equadiff = yy == -x*y
print(desolve(equadiff, y))


xmin = -2; xmax = +2
ymin = -2; ymax = +2 
delta = 1/5
G = Graphics()

# Courbes integrales
    
def courbes_integrales(equadiff,a,b,kmin,kmax,delta):
    G = Graphics()
    for k in srange(kmin, kmax, delta):
        sol = desolve(equadiff, y, ics=[0,k])
        G = G + plot(sol, (x, a, b))
    return G
    
G = Graphics()
G = courbes_integrales(equadiff,xmin,xmax,ymin,ymax,delta)
G.show()
#G.save('equadiff-courbe2.png')


# Champ de vecteurs asocié à y' = f(u,v)
def champ_vecteurs(f,xmin,xmax,ymin,ymax,delta):
    G = Graphics()  
    for i in srange(xmin, xmax, delta):
        for j in srange(ymin, ymax, delta):
            pt = vector([i,j])
            v = vector([1,f(u=i,v=j)])           
            v = v/5           
            G = G + arrow(pt,pt+v,color='red')
    return G

u,v = var('u,v')
f = -u*v

G = Graphics()
G = G + champ_vecteurs(f,xmin,xmax,ymin,ymax,delta)
G.show()
#G.save('equadiff-courbe1.png')


G = Graphics()
G = G + courbes_integrales(equadiff,xmin,xmax,ymin,ymax,delta)
G = G + champ_vecteurs(f,xmin,xmax,ymin,ymax,delta)
G.show()
#G.save('equadiff-courbe3.png')


# Isoclines de y' = f(u,v)
def isoclines(f):
    G = Graphics()
    for c in srange(-2, 2, delta):
        G = G + implicit_plot(f-c, (u,xmin,xmax), (v,ymin, ymax), color='green')
    return G

G = Graphics()
G = G + courbes_integrales(equadiff,xmin,xmax,ymin,ymax,delta)
G = G + isoclines(f)
G.show()
#G.save('equadiff-courbe4.png')
