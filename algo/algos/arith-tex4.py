def eratosthene(n):
    liste_entiers = list(range(n+1))  # tous les entiers
    liste_entiers[1] = 0          # 1 n'est pas premier
    k = 2                         # on commence par les multiples de 2
    while k*k <= n:
        if liste_entiers[k] != 0: # si le nombre k n'est pas barré
            i = k                 # les i sont les multiples de k
            while i <= n-k:
                i = i+k
                liste_entiers[i] = 0  # multiples de k : pas premiers           
        k = k +1       
    liste_premiers = [k for k in liste_entiers if k !=0]  # efface les 0
    return liste_premiers