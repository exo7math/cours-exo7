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
    for i in range(n-1):
        u_n = 1+4*(u_n_2-1)/(u_n_1*u_n_2)        
        u_n_2 = u_n_1
        u_n_1 = u_n
    return u_n
    
def masuitebis(n):
    return (1+2^(n+1))/(1+2^n)
    
    
var('n')    
for n in range(10):
    print n,' ',masuite(n),' ',masuitebis(n)

# Verification formelle   
    
def recur(u_n_1,u_n_2):
   return 1+4*(u_n_2-1)/(u_n_1*u_n_2)

def hypo(n): 
   return (1+2^(n+1))/(1+2^n)

print('Verification de la recurrence par calcul formel')   
print(hypo(0)-3/2)
print(hypo(1)-5/3)

var('n')

test = hypo(n+1)-recur(hypo(n),hypo(n-1))
print(test.simplify_rational())

    
    



  
    
    