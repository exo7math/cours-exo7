def somme_inverse_carres_tronq_inv(n):
  somme = 0
  for i in range(n,0,-1):
      somme = tronquer(somme + tronquer(1/(i*i)))
  return somme