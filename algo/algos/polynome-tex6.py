def produit_rapide(P,Q):
    p = degre(P) ; q = degre(Q)
    if (p == 0): return [P[0]*k for k in Q]  # Condition initiale: P=cst       
    if (q == 0): return [Q[0]*k for k in P]  # Condition initiale: Q=cst
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