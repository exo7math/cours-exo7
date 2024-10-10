var('x,y,z')           # Variables de l'espace
var('X,Y')             # Variables du plan
var('k')          
N = vector([0,0,1])    # Les points N, S, P comme des vecteurs
S = vector([x,y,z])
P = vector([X,Y,0])
V = (P-N)-k*(S-N)      # Le vecteur NP - k NS 
eq = V[2]              # On veut la troisième coordonnée nulle
sol = solve(eq==0,k)   # Equation en k pour cette condition
k = sol[0].rhs()       # Solution k
P = N + k*(S-N)        # Le point P
