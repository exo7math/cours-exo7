#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Arithmetiques et algorithmes récursifs
#------------------------------------------

# Factorielle - méthode itérative
def factorielle_classique(n):
    produit = 1
    for i in range(1,n+1):
        produit = i * produit
    return produit

# Factorielle - méthode récursive
def factorielle(n):
    if (n==1): 
        return 1
    else:
        return n * factorielle(n-1)

# Exemple
print('Factorielle :', factorielle_classique(10), factorielle(10))

# Fibonnacci
def fibonacci(n):
    if (n==0) or (n==1):
        return 1
    else: return fibonacci(n-1)+fibonacci(n-2)
    
 # Exemple
print('Fibonacci :', fibonacci(10))

