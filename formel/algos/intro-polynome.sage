# Fonctions de bases sur les polynômes


R.<X> = QQ[] # Création de l'anneau de polynômes sur Q
P = X^4-3*X^2-1
Q = (X+1)^4

# Opérations classiques 
print(P.degree())
print( (P*Q).degree() == P.degree() + Q.degree() )
print( (P-Q).degree() == max(P.degree(),Q.degree()) )
print(expand(Q))
print(Q[3])
print(P // (X+1)^2,P % (X+1)^2)

# Racines exactes
print(P.roots())
print(Q.roots())
print(P.roots(QQbar))
print(P.real_roots())

racines  = P.roots(QQbar)
alpha =  racines[0][0]
print(alpha == -sqrt((3+sqrt(13))/2))

# Racines approchées 
print(P.roots(RR))
print(P.roots(CC))


# Dans SR
var('X')
P = X^4-3*X^2-1
P.degree(X)
P.coefficient(X,2)

# Illustration du théorème de d'Alembert

R.<X> = CC[]
#var('X')
#P = X^6-3*X^5+(1+I)*X^4+2*(3+I)*X^3+X^2+3*I*X+2*I-1
P = X^4-X^3+X^2-I*X+1

def plot_image_cercle(P,r):
    var('t')
    zreal = P(X=r*exp(I*t)).real()
    zimag = P(X=r*exp(I*t)).imag()
    G = parametric_plot( (zreal,zimag), (t, 0, 2*pi) ) 
    return G

#G = parametric_plot( ( cos(t), sin(t) ), t, 0, 2*pi ) 


# Les racines
racines = P.roots()
for z in racines:
    modz = abs(z[0]).n()
    print modz
    #G = plot_image_cercle(P,modz)
    #G.show()
    
for modz in [0.5,0.617621152310907,0.953421551230189,1.20820613774449,1.40556792013030,1.5]:
    G = plot_image_cercle(P,modz)
    G.show(xmin=-6.7, ymin=-6.7, xmax=6.7, ymax=6.7, axes=True) 
    

#A = animate( [plot_image_cercle(P,r) for r in srange(0.5,1.5,0.05)], xmin=-8, ymin=-8, xmax=8, ymax=8, axes=True)
#A.show(delay=50,iterations=1)


