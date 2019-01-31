def liste_points(f,terme_init,n):
    u = liste_suite(f,terme_init,n)
    mespoints = [ (u[0],0) ]
    for k in range(n-1):
        mespoints.append( (u[k],u[k+1]) )
        mespoints.append( (u[k+1],u[k+1]) )
    return mespoints