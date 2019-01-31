#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Calcul de sinus, cosinus, tangente
#------------------------------------------

# Module mathématique 
# Juste pour vérifier les résultats
from math import *


# Calcul de arctan x, à l'ordre 2*n+1
def mon_arctan(x,n):
    somme = 0
    for k in range(0,n+1):
        if (k%2 == 0):   # si k est pair signe +
            somme = somme + 1/(2*k+1) * (x ** (2*k+1))
        else:            # si k est impair signe -
            somme = somme - 1/(2*k+1) * (x ** (2*k+1))
    return somme

# Pour x = 1, arctan 1 = Pi/4

x = 0.1 ; n = 0
resultat = mon_arctan(x,n)
print("Valeur approchée de arctan de %f avec n=%d itérations : %.10f" %(x, n, resultat))
vrairesultat = atan(x)
print("                             Valeur exacte                 : %.10f" %vrairesultat) 

theta=[pi/4, mon_arctan(0.1,3), mon_arctan(0.01,3), mon_arctan(0.001,3), 0.0001, 0.00001, 0.000001, 0.0000001, 0.00000001, 0.000000001]
print(theta)


# Calcul de tan a
def ma_tan(a):
    precision = 10**(-9)
    i = 0 ; x = 1 ; y = 0
    while (a > precision):             # boucle tant que la precision n'est pas atteinte 
        while (a < theta[i]):          # on commence par choisir le bon angle theta_i à soustriare
            i = i+1
        newa = a - theta[i]            # on retire l'angle theta_i
        newx = x - (10**(-i))*y        # on calcule le nouveau point
        newy = (10**(-i))*x + y
        x = newx
        y = newy
        a = newa       
    return y/x


# Calculs de sinus et cosinus
def mon_sin(a):
    t = ma_tan(a)
    return t/(sqrt(1+t*t))

def mon_cos(a):
    t = ma_tan(a)
    return 1/(sqrt(1+t*t))


x = 0.6
resultat = ma_tan(x)
print("Valeur approchée de tan de %f : %.10f" %(x, resultat))
vrairesultat = tan(x)
print("               Valeur exacte de tan : %.10f" %vrairesultat) 
resultat = mon_sin(x)
print("Valeur approchée de sin de %f : %.10f" %(x, resultat))
vrairesultat = sin(x)
print("               Valeur exacte de sin : %.10f" %vrairesultat) 
resultat = mon_cos(x)
print("Valeur approchée de cos de %f : %.10f" %(x, resultat))
vrairesultat = cos(x)
print("               Valeur exacte de cos : %.10f" %vrairesultat) 
   
   
   