#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Arithmetiques et algorithmes récursifs
#------------------------------------------

# Algorithme d'Euclide
def pgcd(a,b):
    if a%b == 0:
        return b
    else:
        return pgcd(b, a%b)

# Exemple
a = 13*17*23
b = 13*19*23
print('pgcd(%d,%d) = %d' %(a,b,pgcd(a,b)))
a = 1234567
b = a+1
print('pgcd(%d,%d) = %d' %(a,b,pgcd(a,b)))

# Probabilité d'être premier entre eux
import random

# Nombres de couples (a,b) premiers entre eux
# avec 1 <= a,b <= n parmi nbtirages
def nb_premiers_entre_eux(n,nbtirages):
    i = 1
    nbpremiers = 0
    while i <= nbtirages:
        i = i+1
        a = random.randint(1,n)
        b = random.randint(1,n)
        if pgcd(a,b)==1:
            nbpremiers = nbpremiers + 1
    return nbpremiers

n = 1000 ; nbtirages = 10*n ; proba = nb_premiers_entre_eux(n,nbtirages)/nbtirages
print('Pour n=%d et %d tirages la probabilité est : %.5f' %(n,nbtirages, proba))
print('Limite (lorsque n tend vers l''infini) :  6/pi^2 = 0.607927102...')

# Module mathématique
from math import *

# Test de primalité
def est_premier(n):
    k = 2
    while k*k <= n:
        if n%k==0:
            return False
        else: 
            k = k +1
    return True

n = 101
ouiounon = est_premier(n)
print('Est ce que  %d est premier ? %r ' %(n, ouiounon))


# Crible d'Eratosthène
# retourne tous les nombres premiers de 2 à n
def eratosthene(n):
    liste_entiers = list(range(n+1))    # tous les entiers
    liste_entiers[1] = 0                # 1 n'est pas premier : on remplace l'indice par 0
    k = 2                               # on commence par les multiples de 2
    while k*k <= n:
        if liste_entiers[k] != 0:       # si le nombres n'est pas barrés
            i = k                       # les i sont les multiples de k
            while i <= n-k:
                i = i+k
                liste_entiers[i] = 0    # les muliples de k ne sont pas des nombres premiers           
        k = k +1    
    
    liste_premiers = [k for k in liste_entiers if k !=0]  # on efface les zéros
    return liste_premiers


n = 1000
print('Nombres premiers de 1 à %d par le crible d''Eratosthène :' %n)
print(eratosthene(n))  
