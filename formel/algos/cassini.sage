# Assistant de preuve
# Identité de Cassini

# Nombre de fibonacci au rang n par les raciens carrées
def fibonacci_bis(n):
    return 1/sqrt(5)*( ((1+sqrt(5))/2)^n - ((1-sqrt(5))/2)^n ) 
    
 

# Identité de Cassini   
  
# Test pour les premières valeurs
for n in range(1,10):
    valeur = fibonacci(n+1)*fibonacci(n-1)-fibonacci(n)^2
    print n, valeur
    
    
# Preuve de l'identité de Cassini
var('n')
cassini = fibonacci_bis(n+1)*fibonacci_bis(n-1)-fibonacci_bis(n)^2
print('Verification de l identite de Cassini') 
# Formule brute
print(cassini)

#Formule simplifiée
print(cassini.simplify_radical())

# Il faut finir la preuve à la main
# pour trouver (-1)^n
    
    