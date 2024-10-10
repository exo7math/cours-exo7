def puissance(x,k,n):
    puiss = 1                      # Résultat
    while (k>0):
        if k % 2 != 0 :            # Si k est impair (i.e. k_i=1)
            puiss = (puiss*x) % n  
        x = x*x % n                # Vaut x, x^2, x^4,...
        k = k // 2 
    return(puiss)