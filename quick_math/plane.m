syms x
B=[x 0 0;0 x 0;0 0 x];
A=[0 1 1;1 1 1;0 1 0]
C=A-B
D=det(C)
W=solve(D,x)
W = solve(D, x, 'MaxDegree', 3)

