def courbes(X,Y,a,b):
    XYtab = [ [X.subs(t=myt),Y.subs(t=myt),0] for myt in srange(a,b,0.1) ]
    xyztab = [ inverse_stereo(coord[0],coord[1]) for coord in XYtab ]
    G = sphere((0,0,0),1)
    G = G + line(XYtab)    
    G = G + line(xyztab)    
    return G