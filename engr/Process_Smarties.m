figure
I=imread('Smarties.jpg');
imagesc(I);
axis image;
figure
I=mean(I,3);
imagesc(I);
axis image;
colormap gray;
Rmin=20;
Rmax=40;
[S_centres,S_radii]=imfindcircles(I,[Rmin Rmax],'ObjectPolarity','bright');
viscircles(S_centres,S_radii,'Color','r');
figure;
hist(S_radii,15);
xlabel('Radius (pixels)');
ylabel('Frequency');


