# Intégrales

# Sage comme une super-calculatrice

var('x')
# assume(x,'real')

# Primitives
print('---- Primitives -----')
# Fonction 1
print(integral(x^4 + 1/x^2 + exp(x)+ cos(x),x))

# Fonction 2
print(integral(x*sin(x^2),x))

# Fonction 3
var('a','b','c')
print(integral(a/sqrt(1-x^2) + b/(1+x^2) + c/(1+x) ,x))

# Fonction 4
f(x) = x^4/(x^2-1)
print(f.partial_fraction(x))
print(integral(x^4/(x^2-1),x))
# Intégrales

# Fonction 5
var('x,n')
assume(n>0)
f(x) = x^n*ln(x)
print "primitive : ", integral(f(x),x)

print('---- Remarques -----')
# Remarques :
print(integral(1/x))
print(integral(1/x,x,-2,-1))
f(x) = x^4/(x^2-1)
print(f.partial_fraction(x))

# Intégrales
print('---- Intégrales -----')
# Intégrale 1
print(integral(x^2 + sqrt(x) + 1/x + x^(1/3),x,1,3))

# Intégrale 2
print(integral(sin(x)*(1+cos(x))^4,x,0,pi/2))

# Intégrale 2
print(integral(sin(x)^3,x,0,pi/6))

# Intégrale 4
f(x) = (3*x^3 - 2*x^2 - 5*x - 6)/((x^2 + 1)*(x + 1)^2)
g(x) = f.partial_fraction(x)
# f(x) = 1/(x+1) -3/(x+1)^2 + (2*x-4)/(x^2+1)
# f(x) = -1/3*(x^2 - 2)/(x^4 - x^2 + 1) + 1/3*1/(x^2 + 1)
print(integral(f(x),x))
monint = integral(f(x),x,0,sqrt(3))
print(monint)
monintbis = integral(g(x),x,0,sqrt(3))
print(monintbis)
print(g(x))
