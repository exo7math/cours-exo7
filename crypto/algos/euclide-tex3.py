def inverse(a,n):
    c,u,v = euclide_etendu(a,n)    # pgcd et coeff. de Bézout
    if c != 1 :            # Si pgcd différent de 1 renvoie 0
        return 0
    else :
        return u % n                      # Renvoie l'inverse 