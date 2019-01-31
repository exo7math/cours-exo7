def inverse_matrice(A):
    n = A.ncols()
    B = identity_matrix(QQ,n)
    A,B = echelonne_bis(A,B)
    A,B = reduite_bis(A,B)
    return B