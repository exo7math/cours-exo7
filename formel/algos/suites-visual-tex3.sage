def dessine_suite(f,terme_init,n):
    mespoints = liste_points(f,terme_init,n)
    G = plot(f,(x,-1,3))      # La fonction
    G = G + plot(x,(x,-1,3))  # La droite (y=x)
    G = G + line(mespoints)   # La suite
    G.show()