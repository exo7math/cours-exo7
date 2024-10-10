#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Secante
#------------------------------------------


# La fonction
def f(x):
    return x**2 - 10
#    return x**12 - 1.1


# Sécante (n est le nombre d'étape)
def secante(a,b,n):  
    for i in range(1,n+1):
        a = a-f(a)*(b-a)/(f(b)-f(a))
        print("Etape ", i, " : ", a) 
    return a

# Sécante (n est le nombre d'étape)
# m est la minoration de |f'(x)| entre a et b
def secantebis(a,b,n,m):  
    for i in range(1,n+1):
        a = a-f(a)*(b-a)/(f(b)-f(a))
        e = abs(f(a))/m
        print("Etape ", i, " : ", a, "    erreur inférieure à ", e) 
    return a


    
print("Calcul de racine(10) par la méthode de la sécante")
print(secante(3,4,8))  
print(secantebis(3,4,8,6)) 
 

    
#print("Calcul de 1,1^(1/12) par la dichotomie")
#print(secante(1,1.1,8)) 
#print(secantebis(1,1.1,8,12))  
