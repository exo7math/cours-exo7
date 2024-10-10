z = 1-I
for k in range(10):
    print k, z^k, real_part(z^k), imag_part(z^k), abs(z^k), arg(z^k)

for n in range(8):
    print n, factor(2^(2^n)+1)
