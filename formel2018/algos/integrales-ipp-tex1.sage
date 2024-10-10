def FF(n):
    if n==0:
        return exp(x)
    else:
        return x^n*exp(x) - n*FF(n-1)
