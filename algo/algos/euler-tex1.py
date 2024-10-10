def euler1(n):
    somme = 0
    for i in range(n,0,-1):
        somme = somme + 1/i
    return somme - log(n)