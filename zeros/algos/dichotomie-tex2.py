def dicho(a,b,n):    
    for i in range(n):
        c = (a+b)/2
        if f(a)*f(c) <= 0:
            b = c
        else:
            a = c
    return a,b