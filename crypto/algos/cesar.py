#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Le code de César
#------------------------------------------

####################################################
## Pour le chapitre

# Chiffrement de César (pour un chiffre)
def cesar_chiffre_nb(x,k):   
    return (x+k)%26

# Déchiffrement de César (pour un chiffre)
def cesar_dechiffre_nb(x,k):   
    return (x-k)%26

# Chiffrement de César (pour un mot sans espace)
def cesar_chiffre_mot(mot,k):
    message_code = []                      # Liste vide
    for lettre in mot:                     # Pour chaque lettre 
        nb = ord(lettre)-65                # Lettre devient nb de 0 à 25
        nb_crypte = cesar_chiffre(nb,k)    # Chiffrement de César 
        lettre_crypte = chr(nb_crypte+65)  # Retour aux lettres
        message_code.append(lettre_crypte) # Ajoute lettre au message
    message_code = "".join(message_code)   # Revient à chaine caractères
    return(message_code)

# Déchiffrement de César (pour un mot sans espace)
def cesar_dechiffre_mot(mot,k):
    return(cesar_chiffre_mot(mot,-k))


# Attaque par recherche exhaustive
def cesar_attaque(mot):
    for k in range(26):
        print(cesar_chiffre_mot(mot,-k))
    return None


# Exemple
print(cesar_chiffre_mot("ABCDEFGH",2))


####################################################
## Vrai code


# Chiffrement de César (pour un mot ou une phrase)
def cesar_bis(mot,n):
    message_code = []
    # Pour chaque lettre 
    for lettre in mot:
        if lettre == " ":                    # On ne touche pas aux espaces 
            lettre_code = " "
        else:
            nomb = ord(lettre)-65            # Lettre devient nombre de 0 à 25
            nomb_code = (nomb+n) % 26        # Chiffrement de César : on ajoute n
            lettre_code = chr(nomb_code+65)  # On repasse aux lettres
        message_code.append(lettre_code)     # On ajoute la lettre codée au message

    message_code = "".join(message_code)     # On revient à une chaine de caractère
    return(message_code)
    
   
# Déchiffrement de César (pour un mot ou une phrase)
def decode_cesar_bis(mot,n):
    return cesar_bis(mot,-n) 

# Exemple
print("César a dit : ",cesar_bis("ALEA JACTA EST",3))

# Chiffrement puis déchiffrement
n=11
print(cesar_bis("COUCOU",n))
print(decode_cesar_bis(cesar_bis("COUCOU",n),n))

# Chiffrement puis déchiffrement
n=4
print("OCTOBRE devient :", cesar_bis("OCTOBRE",n))
print(decode_cesar_bis(cesar_bis("OCTOBRE",n),n))

# Chiffrement puis déchiffrement
n=9
print("BONJOUR devient :", cesar_bis("BONJOUR",n))
print(decode_cesar_bis(cesar_bis("BONJOUR",n),n))

# rot13
n=13
mot = "CESAR"
print(mot, " devient :", cesar_bis(mot,n))
print(decode_cesar_bis(cesar_bis(mot,n),n))

####################################################
## Attaque par recherche exhaustive

def attaque_cesar_bis(mot):
    for n in range(26):
        print(decode_cesar_bis(mot,n))
    return None

message_code = cesar_bis("HELLO WORLD",16)
attaque_cesar_bis(message_code)

