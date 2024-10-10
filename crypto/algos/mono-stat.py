#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Le chiffrement mono-alphabétique et l'attaque statistique
#------------------------------------------


####################################################
## Pour le chapitre


####################################################
## Vrai code

# Statistique (pour un mot ou une phrase)
def statistique(phrase):
    liste_stat = [0 for x in range(26)]      # On part d'une liste avec des 0
    for lettre in phrase:                    # On parcourt la phrase
        i = ord(lettre)-65
        if 0 <= i < 26:          # Si c'est une vraie lettre
          liste_stat[i] = liste_stat[i] + 1
    return(liste_stat)



# Affichage et tri
def tri_statistique(liste):
    pastri = []                  # Liste avec lettre en face
    for i in range(26):
        pastri.append( (chr(65+i), liste[i]) )  
    tri = sorted(pastri, key=lambda freq: freq[1], reverse=True )
    return(tri)
    
    
# Test 
phrase="ABCDE BCDE CDE DE E F"
liste = statistique(phrase)
print(liste)
print(tri_statistique(liste))


####################################################
## Mono-alphabétique
## Fabrication d'une clé (par un chiffrement qui en fait est affine)
def mono(mot,a,n):
    message_code = []
    # Pour chaque lettre 
    for lettre in mot:
        if lettre == " ":                    # On ne touche pas aux espaces 
            lettre_code = " "
        else:
            nomb = ord(lettre)-65            # Lettre devient nombre de 0 à 25
            nomb_code = ((a*(nomb % 26) % 26)+n) % 26    # Chiffrement ax+n 
            lettre_code = chr(nomb_code+65)  # On repasse aux lettres
        message_code.append(lettre_code)     # On ajoute la lettre codée au message

    message_code = "".join(message_code)     # On revient à une chaine de caractère
    return(message_code)

# Exemple pour expliquer le principe

a=11; b=19            # de sorte que ab = 1 (mod 26)
n = 5; m = (-b*n) % 26  
# Pour code : challenge(mot,a,n)
# Pour decoder : challenge(code,b,m)

print("Mono alphabétique ",m)
alphabet = "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
print("Alphabet codé : ", mono(alphabet,a,n))
print("Vérification  : ",mono(mono(alphabet,a,n),b,m))
phrase = "ETRE OU NE PAS ETRE TELLE EST LA QUESTION"
print(phrase)
print("Phrase codée : ", mono(phrase,a,n))

# Exemple pour l'attaque statistique

a=11; b=19            # de sorte que ab = 1 (mod 26)
n = 15; m = (-b*n) % 26 
print("Mono alphabétique ",m)
phrase = "CECI EST UN ESSAI DE PHRASE VRAIE"
liste = statistique(phrase)
print(liste)
print(tri_statistique(liste))

phrase_codee=mono(phrase,a,n)
print(phrase)
print(phrase_codee)
liste = statistique(phrase_codee)
print(liste)
print(tri_statistique(liste))

####################################################
## Challenge

