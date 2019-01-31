def somme_riemann_milieu(f,a,b,n):
  delta = (b-a)/n
  listx=[a+delta*i for i in range(n+1)]
  listy=[f((listx[i]+listx[i+1])/2) for i in range(n)]
  return delta*sum(listy)

n=6 
f(x)=1/(1+x)
int = somme_riemann_milieu(f(x),0,2,n)
int
838192/765765
