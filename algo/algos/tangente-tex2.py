i = 0
while (a > precision):     # boucle tant que la precision pas atteinte 
    while (a < theta[i]):  # choix du bon angle theta_i à soustraire
        i = i+1
    a = a - theta[i]       # on retire l'angle theta_i et on recommence