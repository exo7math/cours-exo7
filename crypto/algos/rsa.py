#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# RSA
#------------------------------------------


####################################################
## Pour le texte

def init_rsa_txt(p,q,e) :
    n = p * q
    phi = (p-1)*(q-1)    
    c,d,dd = euclide_etendu(e,phi)         # Pgcd et coeff de Bézout
    return(d % phi)                        # Bon représentant


####################################################
## Fonctions utiles

# Algorithme d'Euclide étendu
# Renvoie le pgcd, et les coefficients de Bezout
def euclide_etendu(a,b):
    x = 0 ; xx = 1
    y = 1 ; yy = 0
    while b !=0 :
        q = a // b
        a , b = b , a % b
        x , xx = xx - q*x , x
        y , yy = yy - q*y , y
    return (a,xx,yy)

####################################################
## Etape 1. Génération des clés

## Choix de deux nombres premiers p,q avec "premier.py"
## Choix d'un exposant e

# Vérifions que a et phi sont premiers entre eux
# Calcul de l'inverse d
def init_rsa(p,q,e) :
    n = p * q
    phi = (p-1)*(q-1)    
    c,d,dd = euclide_etendu(e,phi)         # Pgcd et coeff de Bézout
#    print("Coeff. Bézout : d,dd = ", d,dd)
    d = d % phi                            # Bon représentant
    if c != 1 :
        print("Mauvais exposant ! Essayez encore.")
        return None
    else :
        print("Clé publique : n = ", n ,", e = ", e)
        print("Clé privée   : d = ", d)
        print("Outils intermédiaires (à oublier) : p = ", p,", q = ", q,", phi = ", phi)
        return (d)
    
    
##Exemple 1
#p = 5 ; q = 17 ; e = 5  ## d = 13

#n = p*q
#d = init_rsa(p,q,e)


####################################################
## Etape 2. Chiffrement du message

# Chiffrement rsa
# En entrée le message m, la clé publique (n,e)
# En sortie x = m^e (mod n)
def codage_rsa(m,n,e):
    return pow(m,e,n)


####################################################
## Etape 3. déchiffrement du message

# Déchiffrement rsa
# En entrée le message crypté x, l'entier public n et la clé privée d
# En sortie mm = x^d (mod n)
def decodage_rsa(x,n,d):
    return pow(x,d,n)


####################################################
# Exemple 1 

print("====== Exemple 1 =======")

p = 5 ; q = 17 ; e = 5  ## d = 13

m = 10


n = p*q
d = init_rsa(p,q,e)

x = codage_rsa(m,n,e)
mm = decodage_rsa(x,n,d)
print("Message en clair : ", m)
print("Message codé     : ", x)
print("Message décodé   : ", mm)

####################################################
# Exemple 2

print("====== Exemple 2 =======")

p = 101 ; q = 103 ; e = 7  ## d = 8743

m = 1234                   # Message

n = p*q
d = init_rsa(p,q,e)

x = codage_rsa(m,n,e)      # Message codé

mm = decodage_rsa(x,n,d)   # Message décodé

print("Message en clair : ", m)
print("Message codé     : ", x)
print("Message décodé   : ", mm)
