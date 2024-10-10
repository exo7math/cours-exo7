for x in ensemble:
    première ligne de la boucle
    deuxième ligne de la boucle
    ...
    dernière ligne de la boucle
instructions suivantes

# Tant que
while condition:
    première ligne de la boucle
    deuxième ligne de la boucle
    ...
    dernière ligne de la boucle
instruction éxécutée quand la condition n''est plus vérfiée

# Racine carrée
n = 123456789     # l'entier dont on cherche la racine carrée
k = 1             # le premier candidat
while k*k<=n:     # tant que le carré de k ne dépasse pas n
    k = k+1       # on passe au candidat suivant
print(k-1)        # la racine cherchée

# Si ... sinon ...
if condition:
    première ligne d'instruction
    ...
    dernière ligne d'instruction
else:
    autres instructions

# Fonction 
def mafonction (mesvariables):
    première ligne d'instruction
    ...
    dernière ligne d'instruction    
    return monresultat

# Valeur absolue
def valeur_absolue(x):
    if x>=0:
        return x
    else: 
        return -x

# Une fonction bien connue
def ma_fonction(x,y):
    resultat = (x+y+valeur_absolue(x-y))/2
    return resultat


# Un polynôme (de degré 2 ?)
var('a,b,c')

def polynome(x):
  return (x-a)*(x-b)/((c-a)*(c-b))+(x-b)*(x-c)/((a-b)*(a-c))+(x-a)*(x-c)/((b-a)*(b-c))-1 

polynome(a)
polynome(b)
polynome(c)

polynome(x).full_simplify()
    
# Variable locale / Variable globale

x=2
def incremente(x):
    x = x+1
    return x
incremente(x)
print(x)


# Implication

def implique(P,Q)
    return (not(P) or Q)


# Tautologie

for P in {True, False}:
  for Q in {True, False}:
      for R in {True, False}:
          print( not( (not(P and Q) and (Q or R)) and ( P and (not R) ) )  )





