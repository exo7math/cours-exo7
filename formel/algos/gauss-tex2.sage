def echelonne(A):
    n = A.ncols()  # taille de la matrice
    for p in range(n):  # pivot en A[p,p]
        # a. On cherche un coeff non nul
        i = p
        while i < n and A[i,p] == 0: 
            i = i+1
        if i >= n :
            return matrix(n,n) # stoppe ici car pas inversible
        # b. On place la ligne avec coeff non nul en position de pivot
        A = op3(A,p,i)
        # c. On soustrait la ligne du pivot aux lignes en dessous
        for i in range(p+1,n):
            c = -A[i,p]/A[p,p]
            A = op2(A,i,p,c)
    return A
