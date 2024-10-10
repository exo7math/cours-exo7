def statistiques(phrase):
    liste_stat = [0 for x in range(26)]     # Une liste avec des 0
    for lettre in phrase:                   # On parcourt la phrase
        i = ord(lettre)-65
        if 0 <= i < 26:                     # Si c'est une vraie lettre
          liste_stat[i] = liste_stat[i] + 1
    return(liste_stat)
