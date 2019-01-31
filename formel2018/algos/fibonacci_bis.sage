# Assistant de preuve
# Nombre bis de Fibonacci

# Nombre bis de Fibonacci au rang n
def fibonacci_bis(n):
    if n == 0: return 3
    if n == 1: return 0
    if n == 2: return 2
    P_n_3 = 3
    P_n_2 = 0
    P_n_1 = 2
    for k in range(n-2):
        P_n = P_n_2 + P_n_3        
        P_n_3 = P_n_2
        P_n_2 = P_n_1        
        P_n_1 = P_n
    return P_n

var('n')    
for n in range(10):
    print n,' ',fibonacci_bis(n)
    

n = 271441
print(fibonacci_bis(n))

# Verif pour tp7
#n = 10000
#print(fibonacci_bis(n))

# Racines du polynome X^3-X-1
solutions = solve(x^3-x-1==0,x)
print(solutions)


var('alpha,beta,gamma')
alpha = solutions[2].rhs()
beta = solutions[0].rhs()
gamma = solutions[1].rhs()
print 'alpha : ',alpha,'   beta : ',beta,'   gamma : ',gamma





# Nouvelle définition des nombres bis de Fibonacci
# à l'aide de alpha, beta, gamma
def conjec(n):
    return alpha^n+beta^n+gamma^n      

# Vérification des formules pour les premières valeurs
for n in range(10):
    valeur = fibonacci_bis(n)-conjec(n)
    print expand(valeur).full_simplify()
    

# Verification formelle   
    

print('Verification de la recurrence par calcul formel')  
print('Initialisation')
print((fibonacci_bis(0)-conjec(0)).full_simplify())
print((fibonacci_bis(1)-conjec(1)).full_simplify())
print((fibonacci_bis(2)-conjec(2)).full_simplify())

print('Hérédité')
var('n')
test = conjec(n)-conjec(n-2)-conjec(n-3)
print(test.full_simplify())   


#Nombre pseudo-premiers bis de Fibonacci


# Nombre bis de Fibonacci au rang n modulo m
def fibonacci_bis_modulo(n,m):
    if n == 0: return 3
    if n == 1: return 0
    if n == 2: return 2
    P_n_3 = 3
    P_n_2 = 0
    P_n_1 = 2
    for k in range(n-2):
        P_n = (P_n_2 + P_n_3) % m
        P_n_3 = P_n_2
        P_n_2 = P_n_1        
        P_n_1 = P_n
    return P_n

print('Pseudo-premier bis de Fibonacci')
n = 271441
print(fibonacci_bis_modulo(n,n))


for n in range(270000,272000):
    if not(is_prime(n)) and fibonacci_bis_modulo(n,n)==0:
      print n #,' ',fibonacci_bis_modulo(n,n)
      
# Calcul par les puissances de matrices
# A faire après l'agèbre linéaire       
#for n in range(2,10000):
  #if not(is_prime(n)):  
    #m = n
    #R = IntegerModRing(m)
    #M = MatrixSpace(R,3,3)
    #A = M([0,1,1, 1,0,0, 0,1,0])
    #v = vector([2,0,3])
    #print(A^(n-2)*v)


      
