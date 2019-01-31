def echelonne(A):
    ''' échelonne la matrice A '''
    n = A.ncols()  # taille de la matrice
    for p in range(n):   # pivot en A[p,p]
        # a. On cherche un coeff non nul
        i = p
        while i < n and A[i, p] == 0: 
            i = i + 1
        assert i < n, 'matrice non inversible'
		
        # b. On place la ligne avec coeff non nul en position de pivot
        op3(A, p, i)
		
        # c. On soustrait la ligne du pivot aux lignes dessous
        for i in range(p + 1, n):
            c = -A[i, p]/A[p, p]
            op2(A, i, p, c)

