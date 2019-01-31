t = 2*pi/(2^k+1)
u_0 = sin(t)^2
u_k = sin(2^k*t-2*pi)^2
zero = u_k-u_0
zero.simplify_trig()