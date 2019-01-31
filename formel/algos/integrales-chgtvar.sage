# Intégrales

# Changement de variable


# Changement de variable simple
var('x,u')
f = sqrt(1-x^2)

phi = sin(u)
frondphi = f(x=phi)

dphi = diff(phi,u)
g = frondphi*dphi
g = g.simplify_full().simplify_radical()

print 'g', g
G = integral(g,u)
print 'G', G
F = G(u = arcsin(x))
F = F.simplify_full()
print 'Nous : ', F
print 'Sage : ',integral(f,x)


# Changement de variable inverse
var('x,u,n')
assume(n>0)
assume(x,'real')
# Fonction 'f' et changement et 'eqn' son changement de variable

# Exemple 0
f = sqrt(1-x^2)
eqn = x == sin(u)

# Exemple 1
f = (cos(x)+1)^n*sin(x)
eqn = u == cos(x)+1

# Exemple 2
f = 1/(1+((x+1)/x)^(1/3))
eqn = u^3 == (x+1)/x



phi = solve(eqn,x)[0].rhs()      # x en fonction de u : fonction phi
phi_inv = solve(eqn,u)[0].rhs()  # u en fonction de x : inverse de phi
print(phi)
print(phi_inv)
frondphi = f(x=phi)
dphi = diff(phi,u)
g = frondphi*dphi
g = g.simplify_full()

print(g)
G = integrate(g,u)
F = G(u = phi_inv)
F = F.simplify_full()
print 'Sage : ',integral(f,x)
print 'Nous : ',F

# Intégration par changement de variable : primitive
# f(x) est la fonction à intégrer 
# eqn est la relation qui relie la nouvelle variable u à x
def integrale_chgtvar(f,eqn):
    phi = solve(eqn,x)[0].rhs()      # x en fonction de u : fonction phi(u)=x
    phi_inv = solve(eqn,u)[0].rhs()  # u en fonction de x : inverse de phi : phi_inv(x)=u
    frondphi = f(x=phi)              # la fonction f(phi(u))
    dphi = diff(phi,u)               # sa dérivée
    g = frondphi*dphi                # la nouvelle fonction g(u)
    g = g.simplify_full()
    G = integral(g,u)                # g doit être plus facile à intégrer
    F = G(u = phi_inv)               # on revient à la variable x
    F = F.simplify_full()
    return F

    
# Exemple 0
f = sqrt(1-x^2)
eqn = x == sin(u)
print(integrale_chgtvar(f,eqn))

# Exemple 1
f = (cos(x)+1)^n*sin(x)
eqn = u == cos(x)+1
print(integrale_chgtvar(f,eqn))

# Exemple 2
f = 1/(1+((x+1)/x)^(1/3))
eqn = u^3 == (x+1)/x
print(integrale_chgtvar(f,eqn))

# Exemple 3
f = 1/(2+sin(x)^2)
eqn = u == tan(x)
print 'Nous : ', integrale_chgtvar(f,eqn)
print 'Sage : ', integral(f,x)



# Intégration par changement de variable : intégrale
# f(x) est la fonction à intégrer 
# eqn est la relation qui relie la nouvelle variable u à x
def integrale_chgtvar_bornes(f,a,b,eqn):
    phi = solve(eqn,x)[0].rhs()      # x en fonction de u : fonction phi(u)=x
    phi_inv = solve(eqn,u)[0].rhs()  # u en fonction de x : inverse de phi : phi_inv(x)=u
    frondphi = f(x=phi)              # la fonction f(phi(u))
    dphi = diff(phi,u)               # sa dérivée
    g = frondphi*dphi                # la nouvelle fonction g(u)
    g = g.simplify_full()
    a_inv = phi_inv(x=a)             # nouvelles extrémités
    b_inv = phi_inv(x=b)
    new_I = integral(g,u,a_inv,b_inv)  # l'intégrale de g doit être plus facile à calculer
    return new_I
    
# Exemple 
var('x,u,a,b')
f = 1/(2+sin(x)^2)
eqn = u == tan(x)
a = 0
b = pi/4
print 'Nous : ', integrale_chgtvar_bornes(f,a,b,eqn)   
print 'Sage : ', integral(f,x,a,b)
