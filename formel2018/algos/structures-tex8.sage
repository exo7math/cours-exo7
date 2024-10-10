var('a,b,c')

def polynome(x):
  return (x-a)*(x-b)/((c-a)*(c-b))+(x-b)*(x-c)/((a-b)*(a-c))+(x-a)*(x-c)/((b-a)*(b-c))-1 

polynome(a)
polynome(b)
polynome(c)

polynome(x).full_simplify()
