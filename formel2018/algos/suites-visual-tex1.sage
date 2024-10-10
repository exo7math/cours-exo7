def liste_suite(f,terme_init,n):
    maliste = []
    x = terme_init
    for k in range(n):
        maliste.append(x)
        x = f(x)
    return maliste