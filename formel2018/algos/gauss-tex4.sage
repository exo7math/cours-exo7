def inverse_matrice(A):
    ''' renvoie la matrice inverse de A '''
    n = A.ncols()
    AA = copy(A)
    B = identity_matrix(QQ, n)
    echelonne_bis(AA, B)
    reduite_bis(AA, B)
    return B
