def entier_vers_binaire(N):
    tab = []
    n = floor(log(N,2))   # le nombre de chiffres est n+1
    for i in range(0,n+1):
        tab.append((N // 2 ** i) % 2)
    return tab