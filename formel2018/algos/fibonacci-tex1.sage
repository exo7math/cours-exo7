def fibonacci(n):
    if n == 0:
        return 0
    if n == 1:
        return 1        
    F_n_2 = 0
    F_n_1 = 1
    for k in range(n-1):
        F_n = F_n_1 + F_n_2        
        F_n_2 = F_n_1
        F_n_1 = F_n
    return F_n