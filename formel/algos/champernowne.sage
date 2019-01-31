# 
# Constante(s) de Champernowne
# 

def champer(k):
    tau = 0
    decalage = 0
    for nbchiffres in range(1,k+1):
        for i in range(10^nbchiffres):
            decalage = decalage + nbchiffres
            tau = tau + i * 10^(-decalage)
    return tau


print(champer(2).n(digits=100))
    
    
def frac(x):
    return x - floor(x)

print(frac(12.34578))

