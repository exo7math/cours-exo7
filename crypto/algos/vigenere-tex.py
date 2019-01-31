def vigenere(mot,cle):                   # Clé est du type [n_1,...,n_k]
    message_code = []
    k = len(cle)                         # Longueur de la clé
    i = 0                                # Rang dans le bloc   
    for lettre in mot:                   # Pour chaque lettre 
        nomb = ord(lettre)-65            # Lettre devient nb de 0 à 25
        nomb_code = (nomb+cle[i]) % 26   # Vigenère : on ajoute n_i
        lettre_code = chr(nomb_code+65)  # On repasse aux lettres
        i=(i+1) % k                      # On passe au rang suivant
        message_code.append(lettre_code) # Ajoute lettre au message                   
    message_code = "".join(message_code) # Revient à chaine caractères
    return(message_code)