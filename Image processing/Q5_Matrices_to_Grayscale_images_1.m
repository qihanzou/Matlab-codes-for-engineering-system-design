A=zeros(7,7)
A(5,2)=1
A(2:3,3)=1
A(6,3:5)=1
A(2:3,5)=1
A(5,6)=1
imagesc(A)
colormap gray
axis image