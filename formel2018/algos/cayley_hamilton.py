# coding: utf-8

# ## Théorème de Cayley-Hamilton


n = 4
terms = var(['a_{:d}'.format(i) for i in range(n*n)])
A = matrix(n, n, [term for term in terms])
print A

P = A.charpoly()
print P



if P.substitute(x=A) == matrix(n, n):
    print 'Théorème vérifié !'
else:
    print 'contre-exemple trouvé !'


# **Attention** 
# 
# Ne pas définir le polynôme caractéristique de cette façon
#     
#     Q = (A - x * identity_matrix(n)).determinant()
# 
# car du point de vue de Sage ce n'est pas un polynôme mais une expression symbolique





# In[ ]:




# In[ ]:



