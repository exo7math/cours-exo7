
# Pour l'intro du chapitre courbe
#plot(sin(x)*exp(x),(x,-3,3))
#G = plot(sin(x)*exp(x),(x,-3,3),color='red',thickness=3)
#G.show()

# Etude d'une courbe paramétrée
reset()

# Tracé
var('x,y,t,s')
x = t^3-2*t
y = t^2-t

G = parametric_plot((x,y),(t,-1.5,1.8))


# Réduction de l'intervalle d'étude
eqx = x.subs(t=-t)+x
print(eqx.simplify())
eqy = y.subs(t=-t)-y
print(eqy.simplify())

# Point d'intersection avec l'axe verticales
solx = solve(x,t)
print(solx)
for myt in solx:
    myt = myt.rhs()
    G = G + point((x.subs(t=myt),y.subs(t=myt)),pointsize=30,color='blue')


# Tangente vertical et horizontale
xx = diff(x,t)
yy = diff(y,t)
#print('diff',xx,yy)
solxx = solve(xx,t)
solyy = solve(yy,t)
#print('tangente',solxx,solyy)

# Tracé des tangentes
for myt in solxx:
    myt = myt.rhs()
    G = G + point((x.subs(t=myt),y.subs(t=myt)),pointsize=30,color='red')
    G = G + arrow((x.subs(t=myt),y.subs(t=myt)),(x.subs(t=myt),y.subs(t=myt)+0.3),color='red')
    G = G + arrow((x.subs(t=myt),y.subs(t=myt)),(x.subs(t=myt),y.subs(t=myt)-0.3),color='red')

    
for myt in solyy:
    myt = myt.rhs()
    G = G + point((x.subs(t=myt),y.subs(t=myt)),pointsize=30,color='red')
    G = G + arrow((x.subs(t=myt),y.subs(t=myt)),(x.subs(t=myt)+0.3,y.subs(t=myt)),color='red')
    G = G + arrow((x.subs(t=myt),y.subs(t=myt)),(x.subs(t=myt)-0.3,y.subs(t=myt)),color='red')
    

# Points double

## OUBLIE DES POINTS
eqx = x.subs(t=s) - x
eqxs = (eqx/(s-t)).simplify_rational()
eqy = y.subs(t=s) - y 
eqys = (eqy/(s-t)).simplify_rational()
print(eqxs,eqys)


points_double = solve( [eqxs==0,eqys==0], s,t)
print(points_double)
### FIN OUBLI

## Affichage des points doubles
for mypts in points_double:
  mys,myt = mypts[0].rhs(),mypts[1].rhs()
  if mys != myt:
    print(myt)
    myt = myt.n()
    print(myt,x.subs(t=myt),y.subs(t=myt))
    G = G + point((x.subs(t=myt),y.subs(t=myt)),pointsize=30, color='black')

# Affichage
G.show(aspect_ratio=1)
G.save('courbe.png')
