def elliptic(c):
    f(x,y) = y^2-x^3+x+c
    G = implicit_plot(f, (-2, 2), (-2, 2))
    return G

A=animate([elliptic(c)  for c in srange(-1,1,0.1)])
A.show(delay=50,iterations=1)  

#G = elliptic(-0.5)
#G.show()
#G.save('elliptic1.png')

#G = elliptic(-0.3850)
#G.show()
#G.save('elliptic2.png')

#G = elliptic(0)
#G.show()
#G.save('elliptic3.png')