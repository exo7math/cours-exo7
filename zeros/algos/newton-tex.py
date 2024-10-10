def racine_carree(a,n):
    u=4                # N'importe qu'elle valeur > 0
    for i in range(n):
        u = 0.5*(u+a/u)
    return u