def cle_privee(p,q,e) :
    n = p * q
    phi = (p-1)*(q-1)    
    c,d,dd = euclide_etendu(e,phi)         # Pgcd et coeff de Bézout
    return(d % phi)                        # Bon représentant