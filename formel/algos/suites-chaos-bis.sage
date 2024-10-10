# 
# Suites et visualisation : le chaos BIS
# 
# r = 4 


var('x,t')

f(x,r) = 4*x*(1-x)

# Preambule : un peu de trigonométrie
eq = sin(2*t)^2 - 4*sin(t)^2*(1-sin(t)^2)
print(eq.full_simplify())  

h = sin(t)^2
hh =diff(h,t)
sol = solve(hh==0,t)
print(sol)
# Conc : la dérivée ne s'annule pas sur ]0,pi/2[
# Fonction strictement monotone.



# Listes des termes
def liste_suite(F,terme_init,n):
    maliste = []
    x = terme_init
    for k in range(n):
        maliste.append(x)
        x = F(x=x)
    return maliste


# Periodicité : Sage echoue
var('k')
assume(k,'integer')
#k=513
t = 2*pi/(2^k+1)
u_0 = sin(t)^2
u_k = sin(2^k*t-2*pi)^2
zero = u_k-u_0
print(zero)
print('trig',zero.simplify_trig())


# Instabilité
k = 3
t = 2*pi/(2^k+1)
u_0 = sin(t)^2
print(u_0)
u_0_approx = u_0.n(digits=10)
u_0_approx = 0.4131759111
print(u_0_approx)


n = 50
u_0_approx = 0.4131759111
suite_approx = liste_suite(f,u_0_approx,n)
for p in range(0,n,3):
    print(p,suite_approx[p].n())







 
    
    