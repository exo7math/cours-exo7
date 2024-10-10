def somme_inverse_carres_tronq(n):
  somme = 0
  for i in range(1,n+1):
      somme = tronquer(somme + tronquer(1/(i*i)))
  return somme