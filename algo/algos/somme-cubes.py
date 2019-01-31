#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Somme des entiers, sommes des cubes
# Notions : fonction, for, if, else, range, comparaison ==
#------------------------------------------

# Boucle for
n = 10
somme = 0
for i in range(1,n+1):
    somme = somme + i*i*i
print(somme)

# pour i au cube on peut aussi faire : i**3


# Avec des fonctions

# somme des entiers
def somme_entiers(n):
    return n*(n+1)/2
 
# somme des cubes
def somme_cubes(n):
    somme = 0
    for i in range(1,n+1):
        somme = somme + i**3
    return somme  
  

n = 12
if somme_cubes(n) == (somme_entiers(n)**2):
    print("Pour n=", n,"l'assertion est vraie.")
else:   
    print("L'assertion est fausse !")
    
