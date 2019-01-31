def interpolation_lagrange(liste_points):
    n = len(liste_points)-1
    allx = [p[0] for p in liste_points] # Abscisses
    ally = [p[1] for p in liste_points] # Ordonnées
    liste_lagrange = []    
    for i in range(n+1):
        A = prod(X-x for x in allx if x != allx[i])         # Numérateur
        B = prod(allx[i]-x for x in allx if x != allx[i]) # Dénominateur
        L = A/B                                   # Polynôme de Lagrange
        liste_lagrange.append(L)
    # Le polynôme interpolateur :    
    lagrange = sum( liste_lagrange[i]*ally[i] for i in range(n+1) )
    return lagrange