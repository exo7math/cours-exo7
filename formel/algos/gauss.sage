
# Algèbre linéaire
# Réduction de Gauss et calcul de l'inverse

# 1./ Opérations élémentaires

def op1(A,i,c):
    A[i,:] = c*A[i,:]
    return A

def op2(A,i,j,c):
    A[i,:] = A[i,:] + c*A[j,:]
    return A
    
def op3(A,i,j):
    A[i,:],A[j,:] = A[j,:],A[i,:]
    return A

# Ces fonctions changent A si on ne fait pas d'abord une copie dans une autre matrice

# Exemples
A = matrix(3,3,[[1,2,3],[-1,0,1],[0,1,0]])
AA = copy(A)
print 'A\n', AA
print 'op1\n',op1(AA,1,7)
print 'op2\n',op2(AA,0,2,-1)
print 'op3\n',op3(AA,1,2)
print 'A\n', A

# 2./ Passage à une forme échelonnée 
# Cas d'une matrice carrée inversible

def echelonne(A):
    n = A.ncols()  # taille de la matrice
    for p in range(n):   # pivot en A[p,p]
        # a. On cherche un coeff non nul
        i = p
        while i<n and A[i,p] == 0: 
            i = i+1
        if i >= n :
            return matrix(n,n) # stoppe ici car la matrice n'est pas inversible (renvoie la matrice nulle)
        # b. On place la ligne avec coeff non nul en position de pivot
        A = op3(A,p,i)
        # c. On soustrait la ligne du pivot aux lignes dessous
        for i in range(p+1,n):
            c = -A[i,p]/A[p,p]
            A = op2(A,i,p,c)
    return A



# 3./ Passage d'une forme échelonnée à une forme reduite
# Cas d'une matrice carrée inversible

def reduite(A):
    n = A.ncols()  
    for p in range(n-1,-1,-1):
        # a. On divise pour avoir un pivot valant 1
        c = 1/A[p,p]
        A = op1(A,p,c)
        # b. On élimine les coefficients au dessus du pivot
        for i in range(p-1,-1,-1):
            c = -A[i,p]
            A = op2(A,i,p,c)
    return A

# Exemples
A = matrix(3,3,[[1,2,3],[-1,0,1],[0,1,0]])
AA = copy(A)
print('Matrice')
print(A)
print('Matrice échelonnée')
print(echelonne(AA))
print('Matrice échelonnée réduite')
print(reduite(echelonne(AA)))


# Test erreur 
print "*** Erreur à corriger ??? ***"
A = matrix(3,3,[[2,4,6],[-1,0,1],[0,1,0]])
A = A.transpose()
AA = copy(A)
print('Matrice')
print(A)
print('Matrice échelonnée')
print(echelonne(AA))
print('Matrice échelonnée réduite')
print(reduite(echelonne(AA)))
print "*** Fin erreur ??? ***"
# 4./ Calcul de l'inverse

# On echelonne A, toute les opérations sur A
# sont aussi faite sur B
def echelonne_bis(A,B):
    n = A.ncols()  # taille de la matrice
    for p in range(n):   # pivot en A[p,p]
        # a. On cherche un coeff non nul
        i = p
        while i < n and A[i,p] == 0: 
            i = i+1
        if i >= n:
            return matrix(n,n) # stoppe ici car la matrice n'est pas inversible (renvoie la matrice nulle)
        # b. On place la ligne avec coeff non nul en position de pivot
        A = op3(A,p,i)
        B = op3(B,p,i) 
        # c. On soustrait la ligne du pivot aux lignes dessous
        for i in range(p+1,n):
            c = -A[i,p]/A[p,p]
            A = op2(A,i,p,c)
            B = op2(B,i,p,c)
    return A,B


# Idem pour reduite
def reduite_bis(A,B):
    n = A.ncols()  
    for p in range(n-1,0,-1):
        # a. On divise pour avoir un pivot valant 1
        c = 1/A[p,p]
        A = op1(A,p,c)
        B = op1(B,p,c)
        # b. On élimine les coefficients au dessus du pivot
        for i in range(p-1,-1,-1):
            c = -A[i,p]
            A = op2(A,i,p,c)
            B = op2(B,i,p,c) 
    return A,B


def inverse_matrice(A):
    n = A.ncols()
    B = identity_matrix(QQ,n)
    A,B = echelonne_bis(A,B)
    A,B = reduite_bis(A,B)
    return B


# Exemples

#A = matrix(3,3,[[1,2,3],[-1,0,1],[0,1,0]])
#B = identity_matrix(QQ,3)
#A,B = echelonne_bis(A,B)
#print(echelonne_bis(A,B))

A = matrix(3,3,[[1,2,3],[-1,0,1],[0,1,0]])
AA = copy(A)
B = inverse_matrice(AA)
print('Matrice')
print(A)
print('Inverse')
print(B)
print('Vérification :')
print(A*B==identity_matrix(QQ,3),B*A==identity_matrix(QQ,3))




        
