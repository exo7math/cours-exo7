def decoupe(P,n):
    if (degre(P)<n): return P, [0]
    else: return P[0:n], P[n:]