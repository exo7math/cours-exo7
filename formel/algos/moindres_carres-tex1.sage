def moindres_carres(A,B):
    return (A.transpose()*A)^-1 * A.transpose() * B

points = [(-6,0),(-2,1),(1,2),(4,4),(6,4)]

A = matrix([ [1,p[0]] for p in points ])
B = vector(p[1] for p in points)
X = moindres_carres(A,B)