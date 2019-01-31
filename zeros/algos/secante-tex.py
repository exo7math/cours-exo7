def secante(a,b,n):  
    for i in range(n):
        a = a-f(a)*(b-a)/(f(b)-f(a))
    return a