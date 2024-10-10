def inverse_stereo(X, Y):
    r = 1 + X^2 + Y^2
    x = 2*X / r
    y = 2*Y / r
    z = 1 - 2/r
    return x, y, z