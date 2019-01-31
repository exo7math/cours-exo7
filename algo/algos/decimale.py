#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Ecriture des nombres en base 10
#------------------------------------------

# Module mathématique intégrer sans avoir besoin de math.cos
from math import *

# Chiffres en base 10 vers nombre

def chiffres_vers_entier(tab):
    N = 0
    for i in range(len(tab)):
        N = N + tab[i] * (10 ** i)
    return N

# Découpage d'un nombre en chiffres en base 10
def entier_vers_chiffres(N):
    tab = []
    n = floor(log(N,10))   # le nombre de chiffres est n+1
    for i in range(0,n+1):
        tab.append((N // 10 ** i) % 10)
    return tab

# Exemple
mytab=[4,3,2,1]
print(chiffres_vers_entier(mytab))
print(entier_vers_chiffres(1234))

