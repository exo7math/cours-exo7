def somme_rectangles_gauche(f, a, b, n):
    somme = 0
    epsilon = (b-a)/n    
    xk = a
    for k in range(n):
        somme = somme + f(xk)
        xk = xk + epsilon
    return (b-a)/n*somme