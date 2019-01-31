
# Algèbre linéaire
# Méthode des moindres carrés

# 0./ Formule des moindres carrés

def moindres_carres(A,B):
    return (A.transpose()*A)^-1 * A.transpose() * B

# 1./ Régression linéaire

points = [(-6,0),(-2,1),(1,2),(4,4),(6,4)]

A = matrix([ [1,p[0]] for p in points])
B = vector(p[1] for p in points)
X = moindres_carres(A,B)

print('Régression linéaire')
print('Matrice')
print(A)
print('Second membre')
print(B)
print('Solution des moindres carrés')
print(X)

# Droites
a,b = X
G = plot(a+b*x,(x,-7,7))
G = G + point(points,color='red',size=20)
G.show(aspect_ratio=1,ymin=-1,ymax=5)


# 2./ Interpolation polynomiale

d = 3   # degré
A = matrix([[p[0]^k for k in range(d+1)]  for p in points])
B = vector(p[1] for p in points)
X = moindres_carres(A,B)

print('Régression linéaire')
print('Matrice')
print(A)
print('Second membre')
print(B)
print('Solution des moindres carrés')
print(X)

# Polynôme
f  = sum(X[k]*x^k for k in range(d+1))
G = plot(f,(x,-7,7))
G = G + point(points,color='red',size=20)
G.show(aspect_ratio=1,ymin=-1,ymax=5)
    
