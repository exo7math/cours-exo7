
# Algèbre linéaire
# Matrice et applications, image et noyau

K = QQ
A = matrix(K,4,3,[[1,0,2],[5,2,2],[2,1,0],[1,1,-2]])

def application_lineaire(A,X):
    return A*X

X = vector(K,[2,3,4])
Y = application_lineaire(A,X)
print(Y)


# Noyau, image : première méthode
print("Avec right_kernel, right_image")
# Noyau
print("Noyau")
Ker = A.right_kernel()
print(Ker)
# f n'est pas injective

# Base de vecteurs
print(Ker.basis())

X = vector(K,[-2,4,1])
print(X in Ker)

# Image
print("Image")
Im = A.column_space()
print(Im)
# f n'est pas surjective

# Base de vecteurs
print(Im.basis())


X = vector(K,[1,5,2,1])
print(X in Im)



print("Avec transposée")
# Autre méthode avec la transposée


# Attention il faut prendre la transposée 
# pour le noyau et l'image
AA = A.transpose()

# Noyau
print("Noyau")
Ker = AA.kernel()
print(Ker)
# f n'est pas injective

# Base de vecteurs
print(Ker.basis())

X = vector(K,[-2,4,1])
print(X in Ker)

# Image
print("Image")
Im = AA.image()
print(Im)
# f n'est pas surjective

# Base de vecteurs
print(Im.basis())


X = vector(K,[1,5,2,1])
print(X in Im)
