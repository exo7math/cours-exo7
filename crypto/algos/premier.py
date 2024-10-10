#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Génération de nombres premiers
#------------------------------------------

# Modules 
import random
import sys
import math
# from math import sin

# Module qui gère le temps
import time


####################################################
## Pour le chapitre


####################################################
## Génération de nombres premiers
## Code de "langui.sh"

# Test probabilistique pour savoir si un nb est premier
def rabinMiller(n):
     s = n-1
     t = 0
     while s&1 == 0:
         s = s//2
         t +=1
     k = 0
     while k<128:
         a = random.randrange(2,n-1)
         #a^s is computationally infeasible.  we need a more intelligent approach
         #v = (a**s)%n
         #python's core math module can do modular exponentiation
         v = pow(a,s,n) #where values are (num,exp,mod)
         if v != 1:
             i=0
             while v != (n-1):
                 if i == t-1:
                     return False
                 else:
                     i = i+1
                     v = (v**2)%n
         k+=2
     return True

# Test de divisibilité par les nb premiers de 1 à 1000 
def isPrime(n):
     #lowPrimes is all primes (sans 2, which is covered by the bitwise and operator) 
     #under 1000. taking n modulo each lowPrime allows us to remove a huge chunk 
     #of composite numbers from our potential pool without resorting to Rabin-Miller
     lowPrimes =   [3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97
                   ,101,103,107,109,113,127,131,137,139,149,151,157,163,167,173,179
                   ,181,191,193,197,199,211,223,227,229,233,239,241,251,257,263,269
                   ,271,277,281,283,293,307,311,313,317,331,337,347,349,353,359,367
                   ,373,379,383,389,397,401,409,419,421,431,433,439,443,449,457,461
                   ,463,467,479,487,491,499,503,509,521,523,541,547,557,563,569,571
                   ,577,587,593,599,601,607,613,617,619,631,641,643,647,653,659,661
                   ,673,677,683,691,701,709,719,727,733,739,743,751,757,761,769,773
                   ,787,797,809,811,821,823,827,829,839,853,857,859,863,877,881,883
                   ,887,907,911,919,929,937,941,947,953,967,971,977,983,991,997]
     if (n >= 3):
         if (n&1 != 0):
             for p in lowPrimes:
                 if (n == p):
                    return True
                 if (n % p == 0):
                     return False
             return rabinMiller(n)
     return False


# Obtention d'un nb premier, k est le nb de bit (la longueur)
# C'est quand même probabilistique
def generateLargePrime(k):
     #k is the desired bit length
     r=100*(math.log(k,2)+1) #number of attempts max
     rr = r
     while r>0:
        #randrange is mersenne twister and is completely deterministic
        #unusable for serious crypto purposes
         n = random.randrange(2**(k-1),2**(k))
         r-=1
         if isPrime(n) == True:
             return n
#     return "Failure after "+rr+ " tries."
     return "Failure after many tries."



print(generateLargePrime(16))




####################################################
## Challenge

# import math
# Module qui gère le temps
# import time

# Recherche d'une facteur p de n = pq
def facteur(n):
    if n%2 == 0:           # Si n est pair c'est fini
        return 2
    p = math.trunc(math.sqrt(n))
    if p%2 == 0:           # On ne regarde que les p impair    
        p = p -1 
    while (p>2) and (n%p != 0):         
        p = p -2
    return p

temps1 = time.clock()
n = 101*103

print("Facteur de ",n," :",facteur(n))
temps2 = time.clock()
print("Temps : ", temps2 - temps1)

# n = 37284901469*38376628387 # 200 secondes (36 bits)
# n = 80867825107*84279080891 # 171 secondes (37 bits)
# n = 184821372269*191220619013 #  319 secondes (38 bits)


## n = 1025204075149 * 1086400752721 # Trop long > 2 h (40 bits)
## n = 261348896669459*262708386248663 # ?? (48 bits)
##n = 11644604086318443167 * 12065992788855055937   # Trop long > 2 h (64 bits) 

#### n = 50411*60611                # 0.1 secondes  (16 bits) # TOP SECRET ## Chalenge RSA
##### n = 490586350739*534377194849 # 2100 secondes (39 bits)# TOP SECRET ## Challenge factorisation pq





