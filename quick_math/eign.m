M= [-16,-16,-10,33,-2,50;6,-6,10,6,28,-24;19,22,13,-37,20,-86;10,10,8,-19,12,-44;-11,-14,-7,24,-8,48;-6,-9,-3,17,3,21] 
[P,D]=eig(M)
%% eigenvalue:
a1=D(1,1);
a2=D(2,2);
a3=D(3,3);
a4=D(4,4);
a5=D(5,5);
a6=D(6,6);
%% eigenvector:
M1=M-a1*eye(size(M));
M2=M-a2*eye(size(M));
M3=M-a3*eye(size(M));
M4=M-a4*eye(size(M));
M5=M-a5*eye(size(M));
M6=M-a6*eye(size(M));
Mr1=rref(M1)
Mr2=rref(M2)
Mr3=rref(M3)
Mr4=rref(M4)
Mr5=rref(M5)
Mr6=rref(M6)