# Interpolation de Lagrange


R.<X> = RR[]

# Fonctions à interpoler
var('x')
f = sin(2*pi*x)*exp(-x)

# Listes de points
n = 8
liste_points = [ (2*i/n, f(x=2*i/n)) for i in range(n+1) ]


def interpolation_lagrange(liste_points):
    n = len(liste_points)-1
    allx = [p[0] for p in liste_points] # Abscisses
    ally = [p[1] for p in liste_points] # Ordonnées
    liste_lagrange = []    
    for i in range(n+1):
        A = prod(X-x for x in allx if x != allx[i])         # Numérateur
        B = prod(allx[i]-x for x in allx if x != allx[i]) # Dénominateur
        L = A/B                                   # Polynôme de Lagrange
        liste_lagrange.append(L)
    # Le polynôme interpolateur :    
    lagrange = sum( liste_lagrange[i]*ally[i] for i in range(n+1) )
    return lagrange

#print(interpolation_lagrange(liste_points))

P = interpolation_lagrange(liste_points)
print(liste_points)
print(P)

G = plot(f,x,0,2,color='red')
G = G + plot(P(X=x),x,0,2)
G = G + point(liste_points, color = 'black', size = 25)
G.show()

# Comparaison avec la fonction pré-définie par Sage
#PP = R.lagrange_polynomial(liste_points)
#print(PP)


############################################################"
## Phénomène de Runge

f = 1/(1+8*x^2)
# Listes de n+1 points equidistants sur [-1,1] 
n = 10
liste_points = [ (-1+2*i/n, f(x=-1+2*i/n)) for i in range(n+1) ]
P = interpolation_lagrange(liste_points)
G = plot(f,x,-1,1,color='red')
G = G + plot(P(X=x),x,-1,1) 
#G.show(ymax=1.5)

# Suppression du phénomène de Runge par les racines du polynômes de Tchebychev
f = 1/(1+8*x^2)


# Listes de n+1 racines du polynôme de Tchebychev T_{n+1} sur [-1,1] 
n = 10
racines = [ cos( (2*i-1)*pi/(2*n+2) ).n() for i in range(1,n+2)]

liste_points = [ (racines[i], f(x=racines[i])) for i in range(n+1) ]
P = interpolation_lagrange(liste_points)
#G = plot(f,x,-1,1,color='red')
G = G + plot(P(X=x),x,-1,1,color='green') 
G.show()




