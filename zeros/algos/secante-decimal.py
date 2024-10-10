#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Secante
#------------------------------------------

# Module décimale pour avoir une grande précision 
from decimal import *

# Precision souhaitée (par exemple 1010 décimales pour éviter les erreurs d'arrondi)
getcontext().prec = 1010


# La fonction
def f(x):
    return x**2 - 10
#    return x**12 - 1.1



# Sécante (n est le nombre d'étape)
# m est la minoration de |f'(x)| entre a et b
def secantebis(a,b,n,m):  
    for i in range(1,n+1):
        a = a-f(a)*(b-a)/(f(b)-f(a))
        #e = abs(f(a))/m
        #print("Etape ", i, " : ", a, "    erreur inférieure à ", e) 
    return a


    
print("Calcul de racine(10) par la méthode de la sécante")
print(secantebis(Decimal(3),Decimal(4),1073,Decimal(6))) 
 

    
#print("Calcul de 1,1^(1/12) par la dichotomie")
#print(secante(1,1.1,8)) 
#print(secantebis(1,1.1,8,12))  



