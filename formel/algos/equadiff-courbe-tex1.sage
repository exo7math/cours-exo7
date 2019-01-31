def champ_vecteurs(f,xmin,xmax,ymin,ymax,delta):
    G = Graphics()  
    for i in srange(xmin, xmax, delta):
        for j in srange(ymin, ymax, delta):
            pt = vector([i,j])
            v = vector([1,f(u=i,v=j)])                 
            G = G + arrow(pt,pt+v)
    return G
