def integrale_chgtvar(f,eqn):
    phi = solve(eqn,x)[0].rhs()     # x en fonction de u : fonction phi(u)=x
    phi_inv = solve(eqn,u)[0].rhs() # u en fonction de x : inverse de phi : phi_inv(x)=u
    frondphi = f(x=phi)             # la fonction f(phi(u))
    dphi = diff(phi,u)              # sa dérivée
    g = frondphi*dphi               # la nouvelle fonction g(u)
    g = g.simplify_full()
    G = integral(g,u)               # g doit être plus facile à intégrer
    F = G(u = phi_inv)              # on revient à la variable x
    F = F.simplify_full()
    return F
