#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Le chiffrement mono-alphabétique et l'attaque statistique
#------------------------------------------

# Module qui génère des nombres aléatoires
import random

####################################################
## Pour le chapitre

## Fabrication d'une clé et du message codé
def secrete_short(message):
    message_code = []
    cle = []
    for nomb in message:
        n = random.randint(0,25)        # Nombre au hasard
        cle.append(n)                   # On ajoute le nombre à la clé
        nomb_code = (nomb +n) % 26      # Chiffrement : décalage de n 
        message_code.append(nomb_code)  # On ajoute le nombre codé au message
    return(cle, message_code)


m = [0,1,2,3,4]
c,x = secrete_short(m)
print(m,c,x)

####################################################
## Vrai code

## Fabrication d'une clé et du message crypté
def secrete(mot):
    message_code = []
    cle = []
    # Pour chaque lettre 
    for lettre in mot:
        if lettre == " ":                    # On ne touche pas aux espaces 
            lettre_code = " "
        else:
            n = random.randint(0,25)        # Nombre au hasard
            cle.append(n)
            nomb = ord(lettre)-65            # Lettre devient nombre de 0 à 25
            nomb_code = (nomb +n) % 26       # Chiffrement : décalage de n 
            lettre_code = chr(nomb_code+65)  # On repasse aux lettres
        message_code.append(lettre_code)     # On ajoute la lettre codée au message

    message_code = "".join(message_code)     # On revient à une chaine de caractère
    return(cle, message_code)


M = "ATTAQUE LE CHATEAU"
C,X = secrete(M)
print("Message ", M)
print("Clé ", C)
print("Message codé ", X)





# Exemple du cours :
# C = [4, 18, 2, 0, 21, 12, 18, 13, 7, 11, 23, 22, 19, 2, 16, 9]
# X = "ELVALGW YL NEWMGQD"

## Fabrication d'une fausse clé 
def fausse_cle(message_code, faux_message):
    bad_cle = []
    for i in range(len(message_code)):
        m = message_code[i]
        mm = faux_message[i]       
        if m != " ":                  # On ne touche pas aux espaces 
            n = ord(m)-65             # Lettre devient nombre de 0 à 25
            nn = ord(mm)-65
            nb_cle = (n-nn) % 26      # X - M'
            bad_cle.append(nb_cle)      
    return(bad_cle)

# Exemple du cours :
# Message codé
X = "ELVALGW YL NEWMGQD"
# Faux message 
MM = "RECETTE DE CUISINE"
# Calcul de la fausse clé
CC = fausse_cle(X,MM)

print("Message codé ", X)
print("Faux message ", MM)
print("Fausse clé ", CC)


# Vérifications que les fausses clé et les vraies clés fonctionnent !

    
## Cryptage
def cryptage(mot,cle):
    message_code = []
    i=0
    # Pour chaque lettre 
    for lettre in mot:
        if lettre == " ":                       # On ne touche pas aux espaces 
            lettre_code = " "
        else:
            n = random.randint(0,25)            # Nombre au hasard
            nomb = ord(lettre)-65               # Lettre devient nombre de 0 à 25
            nomb_code = (nomb + cle[i]) % 26   # Chiffrement : décalage de n 
            lettre_code = chr(nomb_code+65)     # On repasse aux lettres
            i=i+1
        message_code.append(lettre_code)       # On ajoute la lettre codée au message

    message_code = "".join(message_code)        # On revient à une chaine de caractère
    return(message_code)
    
    
## Décodage
def decodage(mot,cle):
    message_clair = []
    i=0
    # Pour chaque lettre 
    for lettre in mot:
        if lettre == " ":                       # On ne touche pas aux espaces 
            lettre_clair = " "
        else:
            n = random.randint(0,25)            # Nombre au hasard
            nomb = ord(lettre)-65               # Lettre devient nombre de 0 à 25
            nomb_clair = (nomb - cle[i]) % 26   # Déchiffrement : décalage de -n 
            lettre_clair = chr(nomb_clair+65)     # On repasse aux lettres
            i=i+1
        message_clair.append(lettre_clair)       # On ajoute la lettre codée au message

    message_clair = "".join(message_clair)        # On revient à une chaine de caractère
    return(message_clair)


# Message codé
X = "ELVALGW YL NEWMGQD"

# Vraie clé : 
C = [4, 18, 2, 0, 21, 12, 18, 13, 7, 11, 23, 22, 19, 2, 16, 9]

# Fausse clé 
CC = [13, 7, 19, 22, 18, 13, 18, 21, 7, 11, 10, 14, 20, 24, 3, 25]

#Décodage avec la vraie clé :
print("Vrai message ", decodage(X,C))
#Décodage avec la fausse clé :
print("Faux message ", decodage(X,CC))



####################################################
## Challenge


## Fabrication d'une fausse clé 
def fausse_cle_challenge(vrai_message, faux_message):
    bad_cle = []
    for i in range(len(vrai_message)):
        m = vrai_message[i]
        mm = faux_message[i]       
        if m != " ":                  # On ne touche pas aux espaces 
            n = ord(m)-65             # Lettre devient nombre de 0 à 25
            nn = ord(mm)-65
            nb_cle = (nn-n) % 26      # M' - M
            bad_cle.append(nb_cle)      
    return(bad_cle)
    



# Message 1 vrai, 2 faux
M   = "PROFITEZ DE LA VIE"
MM  = "ESSAYEZZ EN CO RRE"
MMM = "CESTPASL AR EP ONS"

# Cles : 2 fausses
CC = fausse_cle_challenge(M,MMM)
CCC = fausse_cle_challenge(M,MM)
# Vraie clé C = C + CC
C = [((CC[i]+CCC[i])%26) for i in range(len(CC))]

# Message crypté
X = cryptage(M,C)

print("===== CHALENGE =====")
print("Message codé ", X)
print("Vraie clé   ", C)
print("Fausse clé 1", CC)
print("Fausse clé 2", CCC)

#Décodage avec la vraie clé :
print("Vrai message  ", decodage(X,C))

#Décodage avec la fausse clé numéro 1:
print("Faux message 1", decodage(X,CC))
#Décodage avec la fausse clé numéro 2:
print("Faux message 2", decodage(X,CCC))

# Message crypté
# X = RFWOFLNL BA VD KWS 
# Clés 
# C   = [2, 14, 8, 9, 23, 18, 9, 12, 24, 22, 10, 3, 15, 14, 14]
# CC  = [13, 13, 4, 14, 7, 7, 14, 12, 23, 13, 19, 15, 19, 5, 14]
# CCC = [15, 1, 4, 21, 16, 11, 21, 0, 1, 9, 17, 14, 22, 9, 0]

####################################################
## Quiz

print("===== Qiuz =====")
M = "TURING"
C,X = secrete(M)
print("Message ", M)
print("Clé ", C)
print("Message codé ", X)