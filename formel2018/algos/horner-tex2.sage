def division_horner(P,alpha):
    n = P.degree()
    if n <= 0: return 0,P
    b = [None] * (n+1)     # Liste triviale de longueur n+1
    b[n] = P[n]
    for k in range(n-1,-1,-1):
        b[k] = alpha*b[k+1] + P[k]
    Q = sum( b[k+1]*X^k for k in range(0,n) )
    R = b[0]
    return Q,R
