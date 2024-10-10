def decalage(tab):
    N = binaire_vers_entier(tab)
    n = len(tab)-1   # le nombre de chiffres est n+1
    NN = 2*N % 2**(n+1) + 2*N // 2**(n+1)
    return entier_vers_binaire_bis(NN,n)