def cesar_chiffre_mot(mot,k):
    message_code = []                      # Liste vide
    for lettre in mot:                     # Pour chaque lettre 
        nb = ord(lettre)-65                # Lettre devient nb de 0 à 25
        nb_crypte = cesar_chiffre_nb(nb,k) # Chiffrement de César 
        lettre_crypte = chr(nb_crypte+65)  # Retour aux lettres
        message_code.append(lettre_crypte) # Ajoute lettre au message
    message_code = "".join(message_code)   # Revient à chaine caractères
    return(message_code)
