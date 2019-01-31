# Assistant de preuve
# Suites

# Exemple
def masuite(n):
    if n == 0:
        return 3/2
    if n == 1:
        return 5/3
    u_n_2 = 3/2
    u_n_1 = 5/3   
    for k in range(n-1):
        u_n = 1+4*(u_n_2-1)/(u_n_1*u_n_2)        
        u_n_2 = u_n_1
        u_n_1 = u_n
    return u_n
    
def conjec(n):
    return (1+2^(n+1))/(1+2^n)
     
var('n')       
for n in range(20):
    print n,' ',masuite(n),' ',conjec(n)

# Verification formelle   
    
print('Verification de la recurrence par calcul formel')   
print(conjec(0)-3/2)
print(conjec(1)-5/3)


def recur(u_n_1,u_n_2):
   return 1+4*(u_n_2-1)/(u_n_1*u_n_2)
   
   
var('n')
test = conjec(n)-recur(conjec(n-1),conjec(n-2))
print(test.simplify_rational())

    
    



  
    
    