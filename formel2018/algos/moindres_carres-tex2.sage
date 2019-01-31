d = 3   # degré
A = matrix([ [p[0]^k for k in range(d+1)]  for p in points ])
B = vector(p[1] for p in points)
X = moindres_carres(A,B)    