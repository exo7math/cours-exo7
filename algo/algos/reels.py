#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Calculs avec les réels 
#------------------------------------------

# Module mathématique intégrer sans avoir besoin de math.cos
from math import *

# Calculer avec les flottants
# Tronquer
precision = 6                                # Nombre de décimales conserver
def tronquer(x):
    n = floor(log(x,10))                     # Exposant
    m = floor( x * 10 ** (precision-1 - n))  # Mantisse
    return m * 10 ** (-precision+1+n)        # Nombre tronquer
    
# Exemple
x = 1.23456789
print(x,"tronquer devient : ", tronquer(x))
x = 123.456789
print(x,"tronquer devient : ", tronquer(x))
x = 123456.789
print(x,"tronquer devient : ", tronquer(x))




# Calculer avec les flottants
# Pb 1 : absorption

print('Absorption', tronquer(1234.56+0.007))


# Calculer avec les flottants
# Pb 2 : élimination

x = 1234.8777
y = 1212.2222
difference = tronquer(tronquer(x)-tronquer(y))
print("Elimination %.4f" %difference)


# Calculer avec les flottants
# Pb 3 : conversion binaire <-> décimale
somme = 0
for i in range(10): somme = somme + 0.1
print(somme)

0.1 + 0.1 == 0.2
0.1 + 0.2 == 0.3

x = 0.2
print("0.2 en Python = %.25f" %x)


# Somme des inverse des carrés
# Précision maximale
def somme_inverse_carres_prec(n):
  somme = 0
  for i in range(1,n+1):
      somme = somme + 1/(i*i)
  return somme

# Somme des inverse des carrés
# Tronquer et dans l'ordre
def somme_inverse_carres_tronq(n):
  somme = 0
  for i in range(1,n+1):
      somme = tronquer(somme + tronquer(1/(i*i)))
  return somme

# Somme des inverse des carrés
# Tronquer et ordre inverse
def somme_inverse_carres_tronq_inv(n):
  somme = 0
  for i in range(n,0,-1):
      somme = tronquer(somme + tronquer(1/(i*i)))
  return somme

n = 100000
print(n, pi**2/6, somme_inverse_carres_prec(n), somme_inverse_carres_tronq(n), somme_inverse_carres_tronq_inv(n))
