def reduite(A):
    ''' réduit la matrice échelonnée A '''
    n = A.ncols()  
    for p in range(n - 1, -1, -1):
        # a. On divise pour avoir un pivot valant 1
        c = 1/A[p, p]
        op1(A, p, c)
		
        # b. On élimine les coefficients au dessus du pivot
        for i in range(p - 1, -1, -1):
            c = -A[i, p]
            op2(A, i, p, c)
