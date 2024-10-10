def ma_tan(a):
    precision = 10**(-9)
    i = 0 ; x = 1 ; y = 0
    while (a > precision):      
        while (a < theta[i]):   
            i = i+1
        newa = a - theta[i]       # on retire l'angle theta_i
        newx = x - (10**(-i))*y   # on calcule le nouveau point
        newy = (10**(-i))*x + y
        x = newx
        y = newy
        a = newa       
    return y/x                    # on renvoie la tangente