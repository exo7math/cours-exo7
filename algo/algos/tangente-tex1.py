def mon_arctan(x,n):
    somme = 0
    for k in range(0,n+1):
        if (k%2 == 0):  # si k est pair signe +
            somme = somme + 1/(2*k+1) * (x ** (2*k+1))
        else:           # si k est impair signe -
            somme = somme - 1/(2*k+1) * (x ** (2*k+1))
    return somme