precision = 6                # Nombre de décimales conservées
def tronquer(x):
    n = floor(log(x,10))                     # Exposant
    m = floor( x * 10 ** (precision-1 - n))  # Mantisse
    return m * 10 ** (-precision+1+n)        # Nombre tronqué