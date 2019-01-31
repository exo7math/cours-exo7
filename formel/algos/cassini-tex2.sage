var('n')
cassini = fibonacci_bis(n+1)*fibonacci_bis(n-1)-fibonacci_bis(n)^2
print(cassini.simplify_radical())