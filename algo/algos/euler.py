#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Constante gamma d'Euler
#------------------------------------------

# Module mathématique intégrer sans avoir besoin de math.cos
from math import *

# Constante d'Euler : calcul naif par la définition
def euler1(n):
    somme = 0
    for i in range(n,0,-1):
        somme = somme + 1/i
    return somme - log(n)

# Exemple 
n=100
print("Constante gamma d'Euler -- Méthode 1 (n=%d) : %.20f" %(n, euler1(n)))


# Constante d'Euler : deuxième méthode
def euler2(n):
    somme = 0
    for i in range(n,0,-1):
        somme = somme + 1/i
    return somme - log(n+1/2+1/(24*n))

# Exemple 
n=100
print("Constante gamma d'Euler -- Méthode 2 (n=%d) : %.20f" %(n, euler2(n)))


# Calcul de la solution alpha de x(ln(x)-1)=1
# Méthode de Newton avec f(x)= x(ln(x)-1)-1 et f'(x)=ln(x)
def newton_alpha(n):
    u = 4
    for i in range(1,n+1):
        u = u - (u*(log(u)-1)-1)/(log(u))
    return u

alpha = newton_alpha(6)
print("alpha = ", alpha)



# Constante d'Euler : méthode de Bessel modifiée
def euler3(n):
    N = floor(alpha*n)     # Borne des sommes, alpha cst calculer avant
    # Calcul de An et Bn
    A = 0 ; B = 0
    H = 0
    for k in range(1,N+1):
        c = ( (n**k)/factorial(k) ) ** 2   # Coefficient commun
        H = H + 1/k                        # Somme harmonique
        A = A + c*H
        B = B + c
    return A/B - log(n)

# Exemple 
n=100
print("Constante gamma d'Euler -- Méthode 3 (n=%d) : %.20f" %(n, euler3(n)))

# Constante d'Euler avec 1000 décimales

# Module décimale pour avoir une grande précision 
from decimal import *

# Precision souhaitée (par exemple 1010 décimales pour éviter les erreurs d'arrondi)
getcontext().prec = 100

# Constante d'Euler : méthode de Bessel modifiée, avec module "decimal"
def euler4(n):
    N = floor(alpha*n) + 1                    # Borne des sommes, alpha = cst calculée avant
    # Calcul de An et Bn
    A = Decimal(0) ; B = Decimal(1)
    H = Decimal(0)
    for k in range(1,N+1):
        c = ( Decimal(n**k)/Decimal(factorial(k)) ) ** 2   # Coefficient commun
        H = Decimal(H) + Decimal(1)/Decimal(k)                               # Somme harmonique
        A = Decimal(A) + Decimal(c)*Decimal(H)
        B = Decimal(B) + Decimal(c)
    return Decimal(A)/Decimal(B) - Decimal(n).ln()

# Exemple 
n=100
print("Constante gamma d'Euler -- Méthode 4 (n=%d) : " %n, euler4(n))


# n= 800 on trouve la constante gamma d'Euler avec 1000 décimales
#0.
#57721566490153286060651209008240243104215933593992
#35988057672348848677267776646709369470632917467495
#14631447249807082480960504014486542836224173997644
#92353625350033374293733773767394279259525824709491
#60087352039481656708532331517766115286211995015079
#84793745085705740029921354786146694029604325421519
#05877553526733139925401296742051375413954911168510
#28079842348775872050384310939973613725530608893312
#67600172479537836759271351577226102734929139407984
#30103417771778088154957066107501016191663340152278
#93586796549725203621287922655595366962817638879272
#68013243101047650596370394739495763890657296792960
#10090151251959509222435014093498712282479497471956
#46976318506676129063811051824197444867836380861749
#45516989279230187739107294578155431600500218284409
#60537724342032854783670151773943987003023703395183
#28690001558193988042707411542227819716523011073565
#83396734871765049194181230004065469314299929777956
#93031005030863034185698032310836916400258929708909
#85486825777364288253954925873629596133298574739302

