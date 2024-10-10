def factorielle(n):
    if (n==1): 
        return 1
    else:
        return n * factorielle(n-1)