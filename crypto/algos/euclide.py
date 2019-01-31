#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Euclide étendu
#------------------------------------------

####################################################
## Code pour chapitre

####################################################
## Vrai code

# Algorithme d'Euclide classique
# Renvoie le pgcd
def euclide(a,b):
    while b !=0 :
        a , b = b , a % b
    return a
    
print(euclide(5*7*13,5*5*7*11))

# Algorithme d'Euclide étendu
# Renvoie le pgcd, et les coefficients de Bezout
def euclide_etendu(a,b):
    x = 1 ; xx = 0
    y = 0 ; yy = 1 
    while b !=0 :
        q = a // b
        a , b = b , a % b
        xx , x = x - q*xx , xx
        yy , y = y - q*yy , yy
    return (a,x,y)


a=7; b = 4    
a= 5*7*13 ; b = 5*5*7*11
c,u,v = euclide_etendu(a,b)
print(c,u,v, a*u+b*v)


# Inverse modulo n
def inverse(a,n):
    c,u,v = euclide_etendu(a,n)
    if c != 1 :          # Si pgcd différent de 1 renvoie 0
        return 0
    else :
        return u % n     # Renvoie l'inverse 

a = 12 ; n = 25
b = inverse(a,n)
print(a,b, a*b % n)

print(inverse(4,12)) # pas d'inverse
