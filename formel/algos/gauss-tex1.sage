def op2(A,i,j,c):
    A[i,:] = A[i,:] + c*A[j,:]
    return A
