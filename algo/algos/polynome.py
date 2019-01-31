#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Polynômes
#------------------------------------------


# Degré du polynôme 
def degre(poly):       
    i = len(poly)-1
    while (i>=0) and (poly[i] == 0):
        i = i-1
    return max(0,i)        # le degré du polynôme nul est 0

# Affichage
def afficher(poly):        
    chaine = ''
    if (degre(poly)==0):                     # polynôme cst
        print(str(poly[0]))
        return str(poly[0])
    if (poly[0] != 0):                       # coeff cst
        chaine = chaine + str(poly[0])
        if degre(poly) != 0:
            chaine = chaine + ' + '

    if (degre(poly)>0) and (poly[1] != 0):   # coeff de X
        if poly[1]==1:
            chaine = chaine + 'X'
        else:
            chaine = chaine + str(poly[1])+'X'
        if degre(poly) != 1:
            chaine = chaine + ' + '        
    for i in range(2,degre(poly)+1):         # coeff de X^i
        if (poly[i] != 0):
            if poly[i]==1:
                chaine = chaine + 'X^'+str(i)
            else:
                chaine = chaine + str(poly[i])+'X^'+str(i)                      
            if degre(poly) != i:
                chaine = chaine + ' + '               
    print(chaine)
    return chaine

# Somme A+B
def somme(A,B):
    n = max(degre(A),degre(B))
    p = min(degre(A),degre(B))
    C = []
    for i in range(0,p+1): 
        s = A[i]+B[i]
        C.append(s)
    if degre(A) > degre(B):
        for i in range(p+1,n+1):
            C.append(A[i])
    if degre(B) > degre(A):
        for i in range(p+1,n+1):
            C.append(B[i])      
    return C

# Somme A+B simple si deg(A)=deg(B)
def fausse_somme(A,B):         
    C = []
    for i in range(0,degre(A)+1): 
        s = A[i]+B[i]
        C.append(s)    
    return C


# Produit A*B
def produit(A,B):
    C = []
    for k in range(degre(A)+degre(B)+1): 
        s = 0
        for i in range(k+1):            
            if ((i <= degre(A)) and (k-i <= degre(B))):
                s = s + A[i]*B[k-i]
        C.append(s)
    return C


# Division euclidienne de A par B (B unitaire)
def division(A,B):
    Q = [0]     # Quotient
    R = A     # Reste
    if (degre(B)==0): return A,[0]
    while (degre(R)>= degre(B)):
        # Génération du polynôme P = X^(deg R-deg B)
        P = [] ; moinsP = []; i =0        
        while i < degre(R)-degre(B):
            i = i+1
            P.append(0)
            moinsP.append(0)
        P.append(R[degre(R)])
        moinsP.append(-R[degre(R)])
        R = somme(R,produit(moinsP,B))
        Q = somme(Q,P)
    return Q,R


# Division euclidienne de A par B (B unitaire)
# code simplifié
def fausse_division(A,B):
    Q = [0]     # Quotient
    R = A       # Reste
    while (degre(R)>= degre(B)):     
        P = monome(R[degre(R)],degre(R)-degre(B)) # Monôme P = r_n X^(deg R-deg B)
        R = somme(R,produit(-P,B))
        Q = somme(Q,P)
    return Q,R


A = [1,1,1,2,3]
B = [1,-2,1]

afficher(A)
afficher(B)
print(degre(A), degre(B))
C = somme(A,B)
print(C)
afficher(C)
C= produit(A,B)
print(C)
afficher(C)

A = [-1,3,-2,-1,2]
#B = [1,-1,1]
B=[1]
Q,R = division(A,B)

#Verification
print('A    :', A)
print('B    :', B)
print('Q    :', Q)
print('R:   :', R)
print('BQ+R :',somme(produit(B,Q),R), '(vérification)')



#------------------------------------------
# Algorithme de Karatsuba
#------------------------------------------

# Découpage d'un polynôme P en P_1 + X^n P_2
def decoupe(P,n):
    if (degre(P)<n): return P, [0]
    else: return P[0:n], P[n:]

# Produit d'un polynôme P par un monôme X^n : ajout de n zéros à gauche
def produit_monome(P,n):
    return [0]*n + P
   
# Produit assez rapide
def produit_assez_rapide(P,Q):
    p = degre(P) ; q = degre(Q)
    if (p == 0): return [P[0]*k for k in Q]  # Condition initiale : P = cst       
    if (q == 0): return [Q[0]*k for k in P]  # Condition initiale : Q = cst
    n = (max(p,q)+1)//2                      # demi-degré
    P1,P2 = decoupe(P,n)                     # decoupages
    Q1,Q2 = decoupe(Q,n)
    P1Q1 = produit_assez_rapide(P1,Q1)       # produits en petits degrés
    P2Q2 = produit_assez_rapide(P2,Q2) 
    P1Q2 = produit_assez_rapide(P1,Q2)
    P2Q1 = produit_assez_rapide(P2,Q1)
    R1 = produit_monome(somme(P1Q2,P2Q1),n)  # décalages
    R2 = produit_monome(P2Q2,2*n)
    return somme(P1Q1,somme(R1,R2))          # sommes
    
# Produit rapide par l'algorithme de Karabutsa
def produit_rapide(P,Q):
    p = degre(P) ; q = degre(Q)
    if (p == 0): return [P[0]*k for k in Q]  # Condition initiale : P = cst       
    if (q == 0): return [Q[0]*k for k in P]  # Condition initiale : Q = cst
    n = (max(p,q)+1)//2                      # demi-degré
    P1,P2 = decoupe(P,n)                     # decoupages
    Q1,Q2 = decoupe(Q,n)
    P1Q1 = produit_rapide(P1,Q1)             # produits en petits degrés
    P2Q2 = produit_rapide(P2,Q2)     
    PQ = produit_rapide(somme(P1,P2),somme(Q1,Q2))
    R1 = somme(PQ,somme([-k for k in P1Q1],[-k for k in P2Q2]))
    R1 = produit_monome(R1,n)                # décalages
    R2 = produit_monome(P2Q2,2*n)
    return somme(P1Q1,somme(R1,R2))          # sommes
    
P = [-1,3,-2,-1,2]
print('P    :', P)
P1, P2 = decoupe(P,3)
print(P1,P2)
Q = produit_monome(P2,3)
print(Q), print(somme(P1,Q))

print(produit_assez_rapide([-1,3,-2,-1,2],[3]))
P = [-1,3] ; Q = [1,3]
P = [-1,3,-2,-1,2] ; Q = [-2,6,4,-3]
print(produit_assez_rapide(P,Q))
print(produit_rapide(P,Q))
print(produit(P,Q))