def pgcd(a,b):
    if a%b == 0:
        return b
    else:
        return pgcd(b, a%b)