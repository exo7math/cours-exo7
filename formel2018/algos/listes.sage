n = 10

entiers =  range(n)
premiers = [k for k in range(n) if is_prime(k)]
doubles = [2*k+1 for k in premiers]
debut = doubles[0:10]
premiersplusrang = [premiers[i]+i for i in range(len(premiers))]

def zeroun(k):
    if is_prime(k):
        return 1
    else:
        return 0
    
binaire = [zeroun(k) for k in range(n)]


print(entiers)
print(premiers)
print(doubles)
print(debut)
print(premiersplusrang)
print(binaire)
