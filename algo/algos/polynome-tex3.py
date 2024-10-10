def division(A,B):
    Q = [0]     # Quotient
    R = A       # Reste
    while (degre(R) >= degre(B)):     
        P = monome(R[degre(R)],degre(R)-degre(B))
        R = somme(R,produit(-P,B))
        Q = somme(Q,P)
    return Q,R