A = [4 8 -4; 8 17 -1; -4 -1 57]
b = [-12 -17 65]'

sym=issymmetric(A)

d=eig(A);
jest = all(d > 0)

R=chol(A);
x=R\(R'\b);
x
