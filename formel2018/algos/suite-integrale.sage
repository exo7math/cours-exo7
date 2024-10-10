# Assistant de preuve
# Suites et integrales

var('x,n')
integrate(-x^n * exp(-x),x)
  
for n in range(7):
    print integrate(-x^n * exp(-x),x)

    
var('n')    
def monintegrale(n):
    return integrate(-x^n * exp(-x),x)
    
test = integrate(-x^n * exp(-x),x) - x^n * exp(-x) - n * integrate(-x^(n-1) * exp(-x),x)
print test
assume(n,'integer')
print(test.expand().full_simplify())