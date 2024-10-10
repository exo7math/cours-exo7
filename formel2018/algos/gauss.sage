# -*- coding: utf-8 -*-

# Algèbre linéaire
# Réduction de Gauss et calcul de l'inverse

# 1./ Opérations élémentaires

def op1(A, i, c):
    ''' modifie la ligne i de la matrice A en la multipliant par c '''
    A[i, :] = c*A[i, :]


def op2(A, i, j, c):
	''' modifie la ligne i de la matrice A en lui ajoutant c fois la ligne j '''
	A[i, :] = A[i, :] + c*A[j, :]

    
def op3(A, i, j):
    ''' échange les lignes i et j de la matrice A '''
    A[i, :], A[j, :] = A[j, :], A[i, :]

# Ces fonctions changent A si on ne fait pas d'abord une copie dans une autre matrice

# Exemples
A = matrix(3, 3, [[1, 2, 3], [-1, 0, 1], [0, 1, 0]])
AA = copy(A)
print 'AA\n', AA
op1(AA, 1, 7)
print 'op1 (multiplication ligne 2 par 7)\n', AA
op2(AA, 0, 2, -1)
print 'op2 (retranche la troisième ligne à la première)\n', AA
op3(AA, 1, 2)
print 'op3 (échange des lignes 2 et 3)\n', AA
print 'A\n', A

# 2./ Passage à une forme échelonnée 
# Cas d'une matrice carrée inversible

def echelonne(A):
    ''' échelonne la matrice A '''
    n = A.ncols()  # taille de la matrice
    for p in range(n):   # pivot en A[p,p]
        # a. On cherche un coeff non nul
        i = p
        while i < n and A[i, p] == 0: 
            i = i + 1
        assert i < n, 'matrice non inversible'
		
        # b. On place la ligne avec coeff non nul en position de pivot
        op3(A, p, i)
		
        # c. On soustrait la ligne du pivot aux lignes dessous
        for i in range(p + 1, n):
            c = -A[i, p]/A[p, p]
            op2(A, i, p, c)



# 3./ Passage d'une forme échelonnée à une forme reduite
# Cas d'une matrice carrée inversible

def reduite(A):
    ''' réduit la matrice échelonnée A '''
    n = A.ncols()  
    for p in range(n - 1, -1, -1):
        # a. On divise pour avoir un pivot valant 1
        c = 1/A[p, p]
        op1(A, p, c)
		
        # b. On élimine les coefficients au dessus du pivot
        for i in range(p - 1, -1, -1):
            c = -A[i, p]
            op2(A, i, p, c)


# Exemples
A = matrix(3, 3, [[1, 2, 3], [-1, 0, 1], [0, 1, 0]])
AA = copy(A)
print('Matrice')
print(AA)
echelonne(AA)
print('Matrice échelonnée')
print(AA)
reduite(AA)
print('Matrice échelonnée réduite')
print(AA)

# Test erreur 
print "*** Erreur à corriger ??? ***"
A = matrix(3,3,[[2,4,6],[-1,0,1],[0,1,0]])
A = A.transpose()
AA = copy(A)
print('Matrice')
print(A)
echelonne(AA)
print('Matrice échelonnée')
print(AA)
reduite(AA)
print('Matrice échelonnée réduite')
print(AA)
print "*** Fin erreur ??? ***"
# 4./ Calcul de l'inverse

# On echelonne A, toute les opérations sur A
# sont aussi faite sur B
def echelonne_bis(A, B):
    n = A.ncols()  # taille de la matrice
    for p in range(n):   # pivot en A[p,p]
        # a. On cherche un coeff non nul
        i = p
        while i < n and A[i, p] == 0: 
            i = i + 1
        assert i < n, 'matrice non inversible'
		
        # b. On place la ligne avec coeff non nul en position de pivot
        op3(A, p, i)
        op3(B, p, i) 
        # c. On soustrait la ligne du pivot aux lignes dessous
        for i in range(p + 1, n):
            c = -A[i,p]/A[p,p]
            op2(A, i, p, c)
            op2(B, i, p, c)


# Idem pour reduite
def reduite_bis(A, B):
    n = A.ncols()  
    for p in range(n - 1, -1, -1):
        # a. On divise pour avoir un pivot valant 1
        c = 1/A[p, p]
        op1(A, p, c)
        op1(B, p, c)
		
        # b. On élimine les coefficients au dessus du pivot
        for i in range(p - 1, -1, -1):
            c = -A[i, p]
            op2(A, i, p, c)
            op2(B, i, p, c) 


def inverse_matrice(A):
    ''' renvoie la matrice inverse de A '''
    n = A.ncols()
    A = copy(A)
    B = identity_matrix(QQ, n)
    echelonne_bis(A, B)
    reduite_bis(A,B)
    return B


# Exemples

#A = matrix(3,3,[[1,2,3],[-1,0,1],[0,1,0]])
#B = identity_matrix(QQ,3)
#A,B = echelonne_bis(A,B)
#print(echelonne_bis(A,B))

A = matrix(3, 3, [[1,2,3], [-1,0,1], [0,1,0]])
B = inverse_matrice(A)
print('Matrice')
print(A)
print('Inverse')
print(B)
print('Vérification :')
print(A*B==identity_matrix(QQ,3),B*A==identity_matrix(QQ,3))




        
