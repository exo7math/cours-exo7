#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# La machine Enigma a un anneau
#------------------------------------------


####################################################
## Pour le chapitre

## Cryptage d'une lettre en fonction de la position de l'anneau
def enigma_lettre(lettre,anneau):
    nomb = ord(lettre)-65            # Lettre devient nombre de 0 à 25
    lettre_codee = anneau[nomb]      # A=0 en correspondance de la première lettre, B=1 de la deuxième,...
    return lettre_codee

## Tourne un anneau d'un cran
def tourne_anneau(anneau):    
    new_anneau = "".join((anneau[1:len(anneau)],anneau[0]))
    return new_anneau

## Cryptage du message, selon l'alphabet indiqué par l'anneau mobile
def enigma(message,anneau):
    message_code = []
    anneau_courant = anneau
    for lettre in message:
        lettre_codee = enigma_lettre(lettre,anneau_courant)          # On code une lettre
        message_code.append(lettre_codee)          # On ajoute la lettre codée au message
        anneau_courant = tourne_anneau(anneau_courant)     # On tourne l'anneau d'un cran
    message_code = "".join(message_code)           # On revient à une chaine de caractère
    return(message_code)



message = "AAAAAAAAA"
anneau = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
message_code = enigma(message,anneau)

print("Anneau ", anneau)
print(tourne_anneau(anneau))
print("Message      ", message)
print("Message codé ", message_code)
