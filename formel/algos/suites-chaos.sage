# 
# Suites et visualisation : le chaos

# Exemple
var('x,r')
f(x,r) = r*x*(1-x)


# Listes des termes
def liste_suite(F,terme_init,n):
    maliste = []
    x = terme_init
    for k in range(n):
        maliste.append(x)
        x = F(x=x,r=r)
    return maliste
 
# var('n')
#print(liste_suite(f(r=2),1/4,10))

# Listes des points 
def liste_points(liste):
    u = liste
    mespoints = [ (u[0],0) ]
    for k in range(len(liste)-1):
        mespoints.append( (u[k],u[k+1]) )
        mespoints.append( (u[k+1],u[k+1]) )
    return mespoints
    

# Dessin
def dessine_suite(F,terme_init,n):
    liste = liste_suite(F,terme_init,n)
    mespoints = liste_points(liste)
    G = plot(F(x=x,r=r),(x,0,1),color='red')     # La fonction
    G = G + plot(x,(x,0,1),color='green') # La droite (y=x)
    G = G + line(mespoints)  
    G.show()


# 4 dessins 
#dessine_suite(f(r=2.2),0.123,20)
#dessine_suite(f(r=3.2),0.123,40)
#dessine_suite(f(r=3.57),0.123,40)
#dessine_suite(f(r=4),0.123,100)

## Deux points d'accumulation 
#dessine_suite(f(r=3.2),0.101,20)
#dessine_suite(f(r=3.2),0.102,20)    
    
## Chaos
#dessine_suite(f(r=4),0.101,30)
#dessine_suite(f(r=4),0.102,30)


# Ensemble de bifurcation
def bifurcation(F,terme_init):
    Nmin = 100            # On oublie Nmin premiers termes
    Nmax = 200            # On conserve les termes entre Nmin et Nmax 
    epsilon = 0.005       # On fait varier r de epsilon à chaque pas
    r = 2.5               # r initial
    mespoints = []
    while r <= 4.0:
        u = liste_suite(F(r=r),terme_init,Nmax)  # On calcule la suite     
        for k in range(Nmin,Nmax): 
            mespoints = mespoints + [(u[k],r)]
        G = points(mespoints,size=1)            
        r = r + epsilon
    G.show()
    
bifurcation(f,0.102)

# Points fixes
var('x,r')
f(x,r) = r*x*(1-x)
pts_fixes = solve(f==x,x)     # (a) Points fixes
ff = diff(f,x)                # Dérivée
ff(x=0)                       # (b) f'(0)
solve(abs(ff(x=(r-1)/r))<1,r) # (c) Condition point attractif


#print( pts_fixes )
#print(ff)
#print( ff(x=0) )
#print(ff(x=(r-1)/r))
#print( solve(abs(ff(x=(r-1)/r))<1,r) )




# Cas r = 2
print('----- r = 2 -----')
#dessine_suite(f(r=2),0.101,30)
#dessine_suite(f(r=2),0.701,30)

var('u')
r = 2
test = (r*u*(1-u) - 1/2) + 2*(u-1/2)^2
test.full_simplify()
#print('test',test.full_simplify())
    

# Cas 3 < r < 1 + sqrt(6)
print('----- 3 < r < 1 + sqrt(6)  -----')
var('x,r')
f(x,r) = r*x*(1-x)             # f
g = f(x=f(x,r))                # g(x) = f(f(x))
pts_doubles = solve(g==x,x)    # (a) Points fixes de g
# Les deux nouveaux points fixes de g :
ell1 = (pts_doubles[0].rhs()).subs(r=r).full_simplify()
ell2 = (pts_doubles[1].rhs()).subs(r=r).full_simplify()
eq = f(x=ell1)-ell2            # (b) l'image de ell1 est ell2 ?
eq.full_simplify()             # Oui !


#print(pts_doubles)
#print(ell1)
#print(ell2)
#print(eq)
#print(eq.full_simplify())



# Cas r = 1+sqrt(5)
print('----- r = 1+sqrt(5) -----')
var('x,r')
f(x,r) = r*x*(1-x)
r = 1+sqrt(5)
g = f(x=f(x,r),r=r)
#g = g.subs(r=r)
#print('g',g)

##dessine_suite(f(r=r),0.6,30)
##dessine_suite(g(r=r),0.6,30)
##dessine_suite(g(r=r),0.901,30) 

# Cycle attractif de longueur 2
r = 1+sqrt(5)
r=r.n()
u_0 = 2/3
u_1 = f(x=u_0,r=r)
g = f(x=f(x,r),r=r)
# Dessin pour f^2
dessine_suite(g(r=r),u_0,20)
dessine_suite(g(r=r),u_1,20)
# Dessin pour f
dessine_suite(f(r=r),u_0,50)

# Cycle attractif de longueur 4
r = 3.56
u_0 = 0.35
dessine_suite(f(r=r),u_0,100)









 
    
    
