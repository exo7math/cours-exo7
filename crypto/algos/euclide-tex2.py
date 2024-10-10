def euclide_etendu(a,b):
    x = 1 ; xx = 0
    y = 0 ; yy = 1 
    while b != 0 :
        q = a // b
        a , b = b , a % b
        xx , x = x - q*xx , xx
        yy , y = y - q*yy , yy
    return (a,x,y)
