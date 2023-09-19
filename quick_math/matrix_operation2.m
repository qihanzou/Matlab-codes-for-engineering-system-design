%% Matrix:
M= [-16,-16,-10,33,-2,50;6,-6,10,6,28,-24;19,22,13,-37,20,-86;10,10,8,-19,12,-44;-11,-14,-7,24,-8,48;-6,-9,-3,17,3,21] 
[P,D]=eig(M);
%% eigenvalue:
syms y
Y=det(M-y*eye(size(M)))
Ys=simplify(Y)
S1 = solve(Ys,y)
S=S1'
for n=1:1:length(S)
    a(n)=S(n)
end