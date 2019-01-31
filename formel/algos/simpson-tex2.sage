def simps(f, a, b, n):
    sum = 0;
    for i in range(n+1):
        x = a + (b - a)*i/n;
        y = f(x);
        if (i > 0 and i < n):
            y = 2*(i%2+1)*y
        sum += y;
    sum = sum * (b-a) / n /3
    return sum
f(x)=x*sin(x)+x+1
simps(f, -10.0, 10.0, 6.0)
27.2593376751902
