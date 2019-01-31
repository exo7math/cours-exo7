def produit(A,B):
    C = []
    for k in range(degre(A)+degre(B)+1): 
        s = 0
        for i in range(k+1):            
            if (i <= degre(A)) and (k-i <= degre(B)):
                s = s + A[i]*B[k-i]
        C.append(s)
    return C