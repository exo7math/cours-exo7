def stereo(x,y,z):  
    X = x/(1-z)
    Y = y/(1-z)
    return X,Y