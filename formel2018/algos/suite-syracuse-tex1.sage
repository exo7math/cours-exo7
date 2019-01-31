def syracuse(u0,n):
    u = u0
    for k in range(n):
        if u%2 == 0:
            u = u//2
        else:
            u = 3*u+1
    return u