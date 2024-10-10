
# Projection stéréographique

var('x,y,z') # Variable de l'espace
var('X,Y')       # Variable du plan



##################################################################
# Finding formulas
# From x,y,z in X,Y 
##################################################################
var('k')          
N = vector([0,0,1])   # Les points N, S, P comme des vecteurs
S = vector([x,y,z])
P = vector([X,Y,0])
V = (P-N)-k*(S-N)     # Les vecteurs NP - k NS 
eq = V[2]             # On veut la troisème coord nulle
sol = solve(eq==0,k)     # Equation en k pour cette condition
k = sol[0].rhs()      # Solution k
P = N + k*(S-N)       # Le point P
print(P)


##################################################################
# The stereographic projection and its inverse
# From x,y,z in X,Y (or inverse)
##################################################################
def stereo(x,y,z):  
    X = x/(1-z)
    Y = y/(1-z)
    return X,Y

def inverse_stereo(X,Y):
    r = 1+X^2+Y^2
    x = 2*X/r
    y = 2*Y/r
    z = 1-2/r
    return x,y,z


##################################################################
# Check of the bijection formula
##################################################################
newx,newy,newz = inverse_stereo(X,Y)
newX, newY = stereo(newx,newy,newz)
print(newX,newY)

# Variante
# Pour composer les fonctions de plusieurs variables
# il faut mettre une étoile !!
print(stereo(*inverse_stereo(X,Y)))
print(inverse_stereo(*stereo(x,y,z)))

print( stereo(x,y,z) )     
newX, newY = stereo(x,y,z)
newx,newy,newz = inverse_stereo(newX,newY)
print(newx.full_simplify(),newy.full_simplify(),newz.full_simplify())

##################################################################
# Dessin des courbes : tout d'un coup pour tex
################################################################## 
def courbes(X,Y,a,b):
    XYtab = [ [X.subs(t=myt),Y.subs(t=myt),0] for myt in srange(a,b,0.1)]
    xyztab = [ inverse_stereo(coord[0],coord[1]) for coord in XYtab]
    G = sphere((0,0,0),1,opacity=0.3)
    G = G + line(XYtab, color = 'green', thickness=5)    
    G = G + line(xyztab, color = 'red', thickness=5)    
    return G

var('t')            # Pour paramétrisation
G = courbes(t^3,t^2,-1.5,1.5)
G.show(aspect_ratio=1)

##################################################################
# Dessin d'une courbe paramétrée X(t), Y(t), t dans [a,b] du plan 
# comme une ligne polygonale
##################################################################   
def courbe2d_to_tab(X,Y,a,b,pas):
#    parametric_plot(X,Y,t,a,b, blue)
    XYtab = [ [X.subs(t=myt),Y.subs(t=myt),0] for myt in srange(a,b,pas)]
    return XYtab   

#print(courbe2d_to_tab(t,t,0,5,1))

##################################################################
# Dessin d'une courbe inverse
##################################################################  
def inv_courbe_tab(XYtab):
    xyztab = [ inverse_stereo(coord[0],coord[1]) for coord in XYtab]
    return xyztab


##################################################################
# Dessin des courbes
##################################################################  
def draw_courbes(X,Y,a,b,pas):
    courbe_plan = courbe2d_to_tab(X,Y,a,b,pas)
    courbe_sphere = inv_courbe_tab(courbe_plan, )
    G = line(courbe_sphere, color = 'red', thickness=5)    
    G = G + line(courbe_plan, color = 'green', thickness=5)
    return G

##################################################################
# Dessin de la sphère
# et autres
##################################################################
def draw_stereographic():
    G = sphere((0,0,0),1,opacity=0.3)
    G = G + circle( (0,0),1, thickness=3 )
    G = G + point([(0,0,1),(0,0,-1)],pointsize=50, color ='blue')  
    G = G + polygon([[-2.5,-2.5,0],[2.5,-2.5,0],[2.5,2.5,0],[-2.5,2.5,0]],color='orange',opacity=0.3)    
    G =  G + point( [[0,0,1],[0,0,-1]], size=12, color ='red')    
    G = G + text3d('N', (0,0,1.2))
    return G

var('t') # Pour paramétrisation
var('a,b,c,d') # Variables annexes


##################################################################
# Affichage : exemple 1
################################################################## 
def exemple1():
    X,Y = 1,2
    x,y,z = inverse_stereo(X,Y)
    G = sphere((0,0,0),1,opacity=0.3) 
    G = G + circle( (0,0),1 )
    G = G + polygon([[-2.5,-2.5,0],[2.5,-2.5,0],[2.5,2.5,0],[-2.5,2.5,0]],color='orange',opacity=0.3)    
    G =  G + point( [[X,Y,0],[x,y,z],[0,0,1],[0,0,-1]], size=12, color ='red')
    G = G + line( [[X,Y,0], [0,0,1]], color ='red', thickness=5)
    G = G + text3d('N', (0,0,1.2))
    G = G + text3d('S', (0.4,0.7,0.9))    
    G = G + text3d('P', (1,2,0.2))
    G.show(aspect_ratio=1,frame=False)
    return

#exemple1()


##################################################################
# Affichage : exemple 2
################################################################## 
def exemple2():
    G = draw_stereographic()
    G = G + draw_courbes(t,0,-30,30,0.1)
    G = G + draw_courbes(cos(t)-2.5,sin(t),-pi,pi+0.2,0.1)
    G.show(aspect_ratio=1,frame=False)
    return

#exemple2()


##################################################################
# Affichage : exemple 3
################################################################## 
def exemple3():
    G = draw_stereographic()    
    G = G + draw_courbes(cos(t)*exp(t),sin(t)*exp(t),-5,5,0.2)
    G.show(aspect_ratio=1,frame=False)
    return

#exemple3()


#G = G + draw_courbes(2*t,-3*t+1,-2,2,0.2)

#G = draw_stereographic()
#G = G + draw_courbes(2*t,-3*t+1,-2,2,0.2)
#G = G + draw_courbes(t,t,-2,2,0.2)
#G = G + draw_courbes(2*cos(t)-2,2*sin(t),-pi,pi,0.2)
#G = G + draw_courbes(cos(t)+2,sin(t),-pi,pi,0.2)
#G = G + draw_courbes(cos(t)*exp(t),sin(t)*exp(t),-5,5,0.2)
#G.show(aspect_ratio=1)


##################################################################
# Preuve formelle : l'image d'un cercle est une droite (on triche on part de la droite)
################################################################## 
X = 2*t
Y = -3*t+1
x,y,z = inverse_stereo(X,Y)
x,y,z = x.full_simplify(),y.full_simplify(),z.full_simplify()
print(x.full_simplify(),y.expand(),z.rational_simplify())
X,Y = stereo(x,y,z)
print(X.full_simplify(),Y.full_simplify())