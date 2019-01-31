#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Exponentiation rapide
#------------------------------------------


####################################################
## Vrai code


def puissance(x,k,n):
    puiss = 1                    # Résultat
    while (k>0):
        if k % 2 != 0 :        # Si k est impair (i.e. k_i=1)
            puiss = puiss * x % n  
        x = x*x % n            # Vaut x, x^2, x^4,...
        k = k // 2 
    return(puiss)
    
print(puissance(5,11,14))
print(puissance(17,154,100))

print(puissance(611574858,2036900067,3055461121))
