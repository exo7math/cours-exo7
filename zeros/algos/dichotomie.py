#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Dichotomie
#------------------------------------------


# La fonction
def f(x):
#    return x**2 - 10
    return x**12 - 1.1


# Dichotomie itératif (n est le nombre d'étape)
def dicho(a,b,n):    
    for i in range(1,n+1):
        c = (a+b)/2
        if f(a)*f(c) <= 0:
            b = c
        else:
            a = c
        print("Etape ", i, " : ", a,"    ", b) 
    return a,b


# Dichotomie itératif (prec est la précision)
def dichobis(a,b,prec):    
    while b-a>prec:
        c = (a+b)/2
        if f(a)*f(c) <= 0:
            b = c
        else:
            a = c    
    return a,b



# Dichotomie récursif
def dichotomie(a,b,prec):
    if b-a<=prec:
        return a,b
    else :
        c = (a+b)/2
        if f(a)*f(c) <= 0:
            return dichotomie(a,c,prec)
        else:
            return dichotomie(c,b,prec)
        
    
print("Calcul de racine(10) par la dichotomie")
print(dicho(3,4,8))  
print(dichobis(3,4,0.001)) 
print(dichotomie(3,4,0.00001))  

    
#print("Calcul de 1,1^(1/12) par la dichotomie")
#print(dicho(1,1.1,8)) 
#print(dichobis(1,1.1,0.001))  
#print(dichotomie(1,1.1,0.00001))  