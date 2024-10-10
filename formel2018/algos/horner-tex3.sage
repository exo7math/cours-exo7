def developpe_horner(P,alpha):
    Q = P
    coeff = []
    while Q != 0:      
        Q,R = division_horner(Q,alpha)
        coeff.append(R)
    return coeff