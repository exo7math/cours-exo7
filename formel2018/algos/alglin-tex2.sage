var('a,b,c,d,x,y,xx,yy')
A = matrix(2, 2, [[a, b], [c, d]])
u = matrix(2, 1, [x, y])
v = matrix(2, 1, [xx, yy])

Ainv = A^(-1)
alpha_matrice = 1 + v.transpose() * Ainv * u
alpha_reel = alpha_matrice[0,0]
B = (A + u * v.transpose())^(-1)
BB  = Ainv - 1/alpha_reel*( Ainv * u * v.transpose() * Ainv )
C = B - BB

for i in range(A.nrows()):
    for j in range(A.ncols()): 
        print( "indices :",i,j,"coeff :", (C[i,j]).full_simplify() )




