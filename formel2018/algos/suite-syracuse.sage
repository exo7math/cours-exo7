# Suite de syracuse


def syracuse(u0,n):
    u = u0
    for k in range(n):
        if u%2 == 0:
            u = u//2
        else:
            u = 3*u+1
        print u
    return u

  
syracuse(14,20)

def vol_syracuse(u0):
    u = u0
    n = 0
    while u <> 1:
        n = n+1
        if u%2 == 0:
            u = u//2
        else:
            u = 3*u+1
    return n
    
print(vol_syracuse(14))




    
