def op2(A, i, j, c):
    ''' modifie la ligne i de la matrice A en lui ajoutant c fois la ligne j '''
    A[i, :] = A[i, :] + c*A[j, :]


