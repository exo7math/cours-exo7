def masuite(n):
    if n == 0:
        return 3/2
    if n == 1:
        return 5/3
    u_n_2, u_n_1 = 3/2, 5/3
    for k in range(n-1):
        u_n = 1+4*(u_n_2-1)/(u_n_1*u_n_2)        
        u_n_2, u_n_1 = u_n_1, u_n
    return u_n