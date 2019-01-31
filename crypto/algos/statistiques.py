#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Statistiques
#------------------------------------------

def statistiques(phrase):
    liste_stat = [0 for x in range(26)]     # Une liste avec des 0
    for lettre in phrase:                   # On parcourt la phrase
        i = ord(lettre)-65
        if 0 <= i < 26:                     # Si c'est une vraie lettre
          liste_stat[i] = liste_stat[i] + 1
    return(liste_stat)

# Affichage et tri
def statistiques_tri(phrase):
    liste=statistiques(phrase)
    pastri = []                  # Liste avec lettre en face
    for i in range(26):
        pastri.append( (chr(65+i), liste[i]) )  
    tri = sorted(pastri, key=lambda freq: freq[1], reverse=True )
    return(tri)
    
    
###################################################
# Tests 
###################################################
phrase="ABCDE BCDE CDE DE E"
print(statistiques(phrase))
print(statistiques_tri(phrase))




