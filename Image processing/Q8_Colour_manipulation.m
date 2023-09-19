% Use imread to read the image into original image matrix, I
I = imread('macarons.jpg');

% Find the height and width of image I
pixel_height = size(I,1);
pixel_width = size(I,2);

% Find the average intensity of the red, green and blue channels using mean function
avg_red_intensity = mean(mean(I(:,:,1)));
avg_green_intensity = mean(mean(I(:,:,2)));
avg_blue_intensity = mean(mean(I(:,:,3)));

% Display I in subplot(2,3,1) with square pixels and a title
subplot(2,3,1)
imagesc(I)
axis image
title('Original')

% Create copies of I
J = I;
K = I;
L = I;
M = I;

% Swap the red and green channels in image J
J(:,:,1)=I(:,:,2)
J(:,:,2)=I(:,:,1)

% Set the blue channel to 0 in image K
K(:,:,3)=0.*I(:,:,3)

% Scalar multiply the red channel by 0.3 in image L
L(:,:,1)=0.3.*I(:,:,1)

% Scalar multiply the green and blue channel by 0.5 in image M
M(:,:,2)=0.5.*I(:,:,2)
M(:,:,3)=0.5.*I(:,:,3)

% Convert 3-channel colour image to grayscale image in image N
N= mean(I,3);

% Display J in subplot(2,3,2) with square pixels and a title
subplot(2,3,2)
imagesc(J)
axis image
title('Red and green swapped')



% Display K in subplot(2,3,3) with square pixels and a title
subplot(2,3,3)
imagesc(K)
axis image
title('Green removed')



% Display L in subplot(2,3,4) with square pixels and a title
subplot(2,3,4)
imagesc(L)
axis image
title('Red decreased')



% Display M in subplot(2,3,5) with square pixels and a title
subplot(2,3,5)
imagesc(M)
axis image
title('Green and blue decreased')



% Display N in subplot(2,3,6) with square pixels, a gray colormap and a title
subplot(2,3,6)
imagesc(N)
axis image
colormap gray
title('Grayscale')