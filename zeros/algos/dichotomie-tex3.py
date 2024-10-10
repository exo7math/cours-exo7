def dichobis(a,b,prec):    
    while b-a>prec:
        c = (a+b)/2
        if f(a)*f(c) <= 0:
            b = c
        else:
            a = c    
    return a,b