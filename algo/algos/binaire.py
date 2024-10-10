#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Ecriture des nombres en base 2
#------------------------------------------

# Module mathématique intégrer sans avoir besoin de math.cos
from math import *


# Chiffres en base 2 vers nombre
def binaire_vers_entier(tab):
    N = 0
    for i in range(len(tab)):
        N = N + tab[i] * (2 ** i)
    return N


# Découpage d'un nombre en chiffres en base 2
def entier_vers_binaire(N):
    tab = []
    n = floor(log(N,2))   # le nombre de chiffres est n+1
    for i in range(0,n+1):
        tab.append((N // 2 ** i) % 2)
    return tab


# Découpage d'un nombre en chiffres en base 2
# avec affichage sur n+1 chiffres (et eventuels zéros non signicatifs)
def entier_vers_binaire_bis(N,n):
    tab = []
    for i in range(0,n+1):
        tab.append((N // 2 ** i) % 2)
    return tab


# Affichage de toutes les configurations (n+1 est la taille de la rampe)
def configurations(n):
    for N in range(2**(n+1)):
        print(entier_vers_binaire_bis(N,n))

# Exemples
mytab=[1,1,0,0,1]
print(binaire_vers_entier(mytab))
print(entier_vers_binaire(19))
print(entier_vers_binaire_bis(19,5))  # avec zéros non significatifs
configurations(3)


# Décalage vers la droite sur la rampe (vers la gauche en binaire)
def decalage(tab):
    N = binaire_vers_entier(tab)
    n = len(tab)-1   # le nombre de chiffres est n+1
    NN = 2*N % 2**(n+1) + 2*N // 2**(n+1)
    return entier_vers_binaire_bis(NN,n)


# Inversion des lampes
def inversion(tab):
    N = binaire_vers_entier(tab)
    n = len(tab)-1   # le nombre de chiffres est n+1
    NN = 2**(n+1)-1 - N
    return entier_vers_binaire_bis(NN,n)



# Exemple
mytab = [1,1,0,1,0,1,1,0,0,1]
print(mytab)
print(decalage(mytab))
print(inversion(mytab))