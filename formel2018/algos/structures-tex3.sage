n = 123456789     # l'entier dont on cherche la racine carrée entière
k = 1             # le premier candidat
while k*k <= n:   # tant que le carré de k ne dépasse pas n
    k = k+1       # on passe au candidat suivant
print(k-1)        # la racine entière cherchée   