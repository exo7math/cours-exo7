
# Algèbre linéaire

#var('x')
#assume(x in QQ)
#K = QQ  # Le corps de base est Q


# 1/ Introduction

A = matrix(3,3,[[1,2,3],[-1,0,1],[0,1,0]])
B = matrix(2,3,[[2,-1,0],[-1,0,1]])
I = identity_matrix(3)
u = matrix(3,1,[1,x,x^2])
v = matrix(3,1,[1,0,1])

print("Quelques produits")
print(B*A)
print(A^2)
print(A*u)
print(B*v)

print("Une puissance et un de ses coefficients")
print( ((A-I)^7) )
print( ((A-I)^7)[1,2] )

print("Un inverse et sa trace")
print(A^-1)
tr = sum ( (A^-1)[i,i] for i in range(3) )
print(tr)

# Passage d'un vecteur à une matrice
u = vector([1,x,x^2])
print(matrix(u))

#print(v.transpose())
#print(u.transpose())


# 2/ Formule de Sherman-Morrison

# 2.1/ dimension 2
var('a,b,c,d,x,y,xx,yy')
A = matrix(2,2,[[a,b],[c,d]])
u = matrix(2,1,[x,y])
v = matrix(2,1,[xx,yy])

# 2.2/ dimension 3
var('a1,a2,a3,a4,a5,a6,a7,a8,a9,x1,x2,x3,y1,y2,y3')
A = matrix(3,3,[[a1,a2,a3],[a4,a5,a6],[a7,a8,a9]])
u = matrix(3,1,[x1,x2,x3])
v = matrix(3,1,[y1,y2,y3])


alpha_matrice = 1 + v.transpose() * (A^-1) * u
alpha_reel = alpha_matrice[0,0]
B = (A + u * v.transpose() )^-1
BB  = A^-1 - 1/alpha_reel*( A^-1 * u * v.transpose() * A^-1 )

print("Formule de Sherman-Morrison")
#print(alpha)
#print(B)
#print(BB)
C = B - BB
for i in range(A.nrows()):
    for j in range(A.ncols()): 
        print( "indices :",i,j,"coeff :", (C[i,j]).full_simplify() )




