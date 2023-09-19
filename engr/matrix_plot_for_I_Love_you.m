img=zeros(7,39)
%I
img(2,2:4)=1
img(6,2:4)=1
img(3:5,3)=1
%L
img(2:6,7)=1
img(6,8:9)=1
%O
img(2,11:13)=1
img(6,11:13)=1
img(3:5,11)=1
img(3:5,13)=1
%V
img(2:3,15)=1
img(4:5,16)=1
img(6,17)=1
img(4:5,18)=1
img(2:3,19)=1
%E
img(2:6,21)=1
img(2,22:23)=1
img(4,22:23)=1
img(6,22:23)=1
%Y
img(2,26)=1
img(3,27)=1
img(4:6,28)=1
img(3,29)=1
img(2,30)=1
%O
img(2,32:34)=1
img(6,32:34)=1
img(3:5,32)=1
img(3:5,34)=1
%U
img(2:6,36)=1
img(6,37)=1
img(2:6,38)=1
%D
%img(2:6,43)=1
%img(2,44:45)=1
%img(3:5,46)=1
%img(6,44:45)=1
%Y
%img(2,49)=1
%img(3,50)=1
%img(4:6,51)=1
%img(3,52)=1
%img(2,53)=1

figure(1)
imagesc(img)
axis image
axis off
colormap gray
hold on
