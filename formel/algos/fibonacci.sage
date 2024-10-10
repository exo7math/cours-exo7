# Assistant de preuve
# Nombre de Fibonacci

# Nombre de fibonacci au rang n
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
    
var('n')    
for n in range(10):
    print n,' ',fibonacci(n)
    
    
# Racines du polynome X^2-X-1
solutions = solve(x^2-x-1==0,x)
print(solutions)


var('phi,psi')
phi = solutions[1].rhs()
psi = solutions[0].rhs()
print 'phi : ',phi,'   psi : ',psi





# Nouvelle définition des nombres de Fibonacci
# à l'aide de phi et psi
def conjec(n):
    return 1/sqrt(5)*(phi^n-psi^n)      

# Vérification des formules pour les premières valeurs
for n in range(10):
    valeur = fibonacci(n)-conjec(n)
    print expand(valeur)
    

    

    
# Verification formelle   
    

print('Verification de la recurrence par calcul formel')   
print(fibonacci(0)-conjec(0))
print(fibonacci(1)-conjec(1))

var('n')
test = conjec(n)-conjec(n-1)-conjec(n-2)
print(test.simplify_radical())   

