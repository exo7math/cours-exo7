def courbes_integrales(equadiff,a,b,kmin,kmax,delta):
    G = Graphics()
    for k in srange(kmin, kmax, delta):
        sol = desolve(equadiff, y, ics=[0,k])
        G = G + plot(sol, (x, a, b))
    return G
