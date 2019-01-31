
# Algèbre linéaire
# Systèmes linéaires

#A = matrix(2,2,[[30,591400],[5291/1000,-613/100]])
#B = matrix(2,1,[591700,4678/100])

##print(A)
##print(A^-1)
#print( (A^-1).n()*B )

##print(A.n(digits=5))
#print( (A.n(digits=5))^-1*B )

n = 10
K = QQ
precision = 10

# Trouver d'autres matrices car :
# Vandermonde : les coeff explose donc c'est pas surprenant qu'elle se comporte mal par arrondi
# Hilbert : c'est trop proche du livre Sage

# Matrice de Vandermonde ou Hilbert
A = matrix(K,n,n)
for i in range(n):
    for j in range(n):
        A[i,j] = 1/(i+j+1) # (2+i)^(j)
        
#print(A)

# Second membre
B = matrix(K,n,1)
for i in range(n):
    B[i] = 1 # ((2+i)^n-1)/(i+1)

#print(B)

# Solution exacte
X = A^-1 * B
#print(X)

# Matrice approchée
An = A.n(digits = precision)
#print(An)

# Solution approchée
Xn = An^-1 * B

print(X-Xn)

# Résidu
print(A*Xn-B)


## Redimensionnement de la matrice
#AA = matrix(K,n,n)
#for i in range(n):
    #for j in range(n):
        #AA[i,j] = A[i,j] / A[i,n-1]

## et du second membre
#BB = matrix(K,n,1)
#for i in range(n):
    #BB[i] = B[i] / A[i,n-1]
    
    
## Solution exacte
#XX = AA^-1 * BB

## Matrice approchée
#AAn = AA.n(digits = precision)
#print(AAn)

#XXn = AAn^-1 * BB
#print(XX)
#print(XXn)

## Résidu
#print(AA*XXn-BB)
    

