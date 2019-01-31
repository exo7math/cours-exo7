# Intégrales - Intégration par parties



# Primitive
var('x,n')
assume(n,'integer')
assume(n>1)

f = x^n*exp(x)
F = integral(f,x)
Fprime = diff(F,x)
print "fonction", f
print "primitive", F


# Sage ne sait pas (encore) vérifier ici que dériver la primitive redonne la fonction
print Fprime

def F(n):
    return integral(x^n*exp(x),x)

# Premières valeurs    
for n in range(0,10):
    monint  = F(n)
    print n,'  ', monint

# Relation de récurrence
for n in range(1,10):
    montest  = F(n) - x^n*exp(x) + n*F(n-1)
    print n,'  ', montest.expand()   
    
var('x,n')


# Sage ne sait pas (encore) vérifier formellement cette relation de récurrence
test = F(n) - x^n*exp(x) + n*F(n-1)
print(test.expand())

# Nouvelle formulation récursive
def FF(n):
    if n==0:
        return exp(x)
    else:
        return x^n*exp(x) - n*FF(n-1)

        
# Test de la formule récursive
for n in range(0,10):
    test = F(n)-FF(n)
    print n,'  ', test.expand()
    
var('x,n,k')   
# Formule directe
def FFF(n): 
    return exp(x)*sum((-1)^(n-k)*x^k*factorial(n)/factorial(k),k,0,n)

# Sage ne sait pas (encore) vérifier formellement cette relation de récurrence
test = FFF(n) - x^n*exp(x) + n*FFF(n-1)
print(test.full_simplify())

# Test de la formule directe
for n in range(0,10):
    test = F(n)-FFF(n)
    print n,'  ', test.expand()    
    

  
