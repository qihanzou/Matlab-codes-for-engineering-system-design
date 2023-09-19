% Define matrices R, G and B
R = [1 0 0;0.5 0 0.5;0.33 0.75 0.5];
G = [0 1 0;0.5 0.5 0;0.33 0.25 0.25];
B = [0 0 1;0 0.5 0.5;0.33 0 0.25];

% Use the imagesc function to display matrix R with square pixels and a gray colormap
subplot(2,3,1)
imagesc(R)
axis image
colormap gray



% Use the imagesc function to display matrix G with square pixels
subplot(2,3,2)
imagesc(G)
axis image
colormap gray


% Use the imagesc function to display matrix B with square pixels
subplot(2,3,3)
imagesc(B)
axis image
colormap gray


% Construct a 3D array called color out of matrices R, G and B
color = R;
color(:,:,2)=G
color(:,:,3)=B

% Use the imagesc function to display 3D array color with square pixels
subplot(2,3,4)
imagesc(color(:,:,:))
axis image

% Use the imagesc function to display the first row of color with square pixels
subplot(2,3,5)
imagesc(color(1,:,:))
axis image

% Use the imagesc function to display the third column of color with square pixels
subplot(2,3,6)
imagesc(color(:,3,:))
axis image