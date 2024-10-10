var('x,r')
f(x,r) = r*x*(1-x)
pts_fixes = solve(f==x,x)     # (a) Points fixes
ff = diff(f,x)                # Dérivée
ff(x=0)                       # (b) f'(0)
solve(abs(ff(x=(r-1)/r))<1,r) # (c) Condition point attractif