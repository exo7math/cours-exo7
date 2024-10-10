def conjec(n):
    return 1/sqrt(5)*(phi^n-psi^n)      

for n in range(10):
    valeur = fibonacci(n)-conjec(n)
    print expand(valeur)