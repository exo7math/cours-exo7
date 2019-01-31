# 
# Suites et visualisation


var('n,x')

# La fonction
f(x) = exp(-x)

# Listes des termes
def liste_suite(f,terme_init,n):
    maliste = []
    x = terme_init
    for k in range(n):
        maliste.append(x)
        x = f(x)
    return maliste
 
var('n')

print(liste_suite(f,-1,4))

# Listes des points 
def liste_points(f,terme_init,n):
    u = liste_suite(f,terme_init,n)
    mespoints = [ (u[0],0) ]
    for k in range(n-1):
        mespoints.append( (u[k],u[k+1]) )
        mespoints.append( (u[k+1],u[k+1]) )
    return mespoints
    
    
print(liste_points(f,-1,3))

    
# Dessin
def dessine_suite(f,terme_init,n):
    mespoints = liste_points(f,terme_init,n)
    G = plot(f,(x,-1,3))     # La fonction
    G = G + plot(x,(x,-1,3),color="gray") # La droite (y=x)
    G = G + line(mespoints,color="red") # La suite
    G.show(aspect_ratio=1)
    
    
dessine_suite(f,-1,10)

# Preuve de la convergence et calcul de la limite

g = f(f(x))
G = plot(g,(x,-2,4))
G = G + plot(x,(x,-2,4),color="gray") # La droite (y=x)
G.show(aspect_ratio=1)

solution = solve(f(x)==x,x)
print(solution)

solution_numerique = find_root(f(x)==x,0,1)
print(solution_numerique)

    
    



  
    
    
