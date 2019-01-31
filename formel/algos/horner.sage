
# Algorithme de Horner pour les polynômes

# 1. Calcul de P(alpha)

R.<X> = QQ[]
P = (X-2)*(X^4+3*X^3+X^2+2*X+1)
# P = X^5 + X^4 - 5*X^3 - 3*X - 2


def eval_horner(P,alpha):
    n = P.degree()
    val = P[n]
    for k in range(n-1,-1,-1):
        val = alpha*val + P[k]
    return val

# Exemples
alpha = 2
print(eval_horner(P,alpha))

alpha = -1
print(eval_horner(P,alpha))


# 2. Division euclidienne de P(X) par X-alpha
def division_horner(P,alpha):
    n = P.degree()
    if n <= 0: return 0,P
    b = [None] * (n+1)     # Liste triviale de longueur n+1
    b[n] = P[n]
    for k in range(n-1,-1,-1):
        b[k] = alpha*b[k+1] + P[k]
    Q = sum( b[k+1]*X^k for k in range(0,n) )
    R = b[0]
    return Q,R


# Exemples
alpha = 2
print(division_horner(P,alpha))
print(P//(X-alpha),P%(X-alpha))

alpha = -1
print(division_horner(P,alpha))
print(P//(X-alpha),P%(X-alpha))


# 3. Développement en base (X-alpha)^k
def developpe_horner(P,alpha):
    Q = P
    coeff = []
    while Q != 0:      
        Q,R = division_horner(Q,alpha)
        coeff.append(R)
    return coeff 


# Exemples
alpha = 2
coeff = developpe_horner(P,alpha)
print(coeff)
PP = sum(coeff[k]*(X-alpha)^k for k in range(P.degree()+1))
print(PP)
verif = P-PP
print(expand(verif))

alpha = -1
coeff = developpe_horner(P,alpha)
print(coeff)
PP = sum(coeff[k]*(X-alpha)^k for k in range(P.degree()+1))
print(PP)
verif = P-PP
print(expand(verif))



