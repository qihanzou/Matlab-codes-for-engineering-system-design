A = [8 5 0 8 1 1 1 9 4; 5 4 6 4 2 4 1 8 6; 9 8 6 8 1 8 1 7 0;
    6 2 7 2 1 8 6 5 8; 5 4 8 5 0 2 5 1 5; 8 9 9 6 6 2 0 3 8;
    8 5 7 0 2 5 9 1 3; 9 8 5 6 5 6 7 0 4; 0 7 9 3 6 4 7 9 0;
    8 5 5 0 4 2 0 3 1; 6 2 0 4 5 9 8 2 6; 9 6 1 1 4 0 9 3 3];
A(:,:,2) = [8 1 7 4 2 3 6 8 1; 1 3 7 0 0 2 5 7 6; 9 0 5 8 5 7 3 7 3;
    5 5 1 1 7 0 0 0 6; 7 3 5 0 6 0 7 0 7; 9 1 2 3 0 6 3 0 5;
    2 2 1 4 0 6 6 7 7; 4 9 2 1 7 5 7 9 2; 4 6 8 9 9 7 1 6 7;
    7 4 0 3 5 7 1 1 9; 8 9 2 2 1 7 5 7 8; 1 1 0 0 8 2 4 1 0];
A(:,:,3) = [3 2 1 1 0 1 8 9 1; 3 6 7 2 3 6 7 1 7; 6 4 2 7 7 1 5 2 8;
    5 1 6 4 6 1 1 3 3; 7 7 9 7 1 0 2 0 6; 3 1 4 3 1 1 0 6 2;
    2 2 6 2 0 1 9 4 5; 0 2 7 0 0 1 7 9 8; 7 5 4 6 4 3 5 4 5;
    2 0 6 4 6 3 3 6 3; 3 4 1 4 7 2 1 1 2; 5 1 9 6 5 2 6 3 4];
A2=A(:,:,2)
A3=A(:,:,3)
B=A2(5,8)
C=A(11,2)
D=A3(1:6,7:9)
E=A([1,3,4,8,12],[2,7,8,9],:)
F=A(:,[2:5],[2,3])
G=A(:,:,1).*A(:,:,2)
H=A(:,:,2)*A(:,:,3)'
I=(A(:,:,:)>4)
J=(A(:,:,1)<=5)
K=A(I)
L=mean(A,3)