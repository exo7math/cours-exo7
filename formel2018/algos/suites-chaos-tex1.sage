def bifurcation(F,terme_init):
    Nmin = 100            # On oublie Nmin premiers termes
    Nmax = 200            # On conserve les termes entre Nmin et Nmax 
    epsilon = 0.005       # On fait varier r de epsilon à chaque pas
    r = 2.5               # r initial
    mespoints = []
    while r <= 4.0:
        u = liste_suite(F(x,r),terme_init,Nmax)  # On calcule la suite     
        for k in range(Nmin,Nmax): 
            mespoints = mespoints + [(u[k],r)]
        r = r + epsilon
    G = points(mespoints)
    G.show()
