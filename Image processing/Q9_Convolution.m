% Use imread to read the image into original image matrix, I
I = imread('pikachu.jpg');

% Display I in subplot(2,3,1) with square pixels and a title
subplot(2,3,1)
imagesc(I)
axis image
title('Original')


% Convert 3-channel colour image to grayscale image
grayimage = mean(I,3);

% Display grayimage in subplot(2,3,2) with square pixels, a gray colormap and a title
subplot(2,3,2)
imagesc(grayimage)
axis image
colormap gray
title('Grayscale')

% Define convolution matrices A, B and C
A = [0 -1 0;-1 5 -1;0 -1 0];
B = 1/9.*[1 1 1;1 1 1;1 1 1];
C = [-1 -1 -1;-1 8 -1;-1 -1 -1];

% Use conv2 to convolve grayimage with A, B and C
grayimage_sharpen = conv2(grayimage,A);
grayimage_boxblur = conv2(grayimage,B);
grayimage_edges = conv2(grayimage,C);

% Display grayimage_sharpen in subplot(2,3,3) with square pixels and a title
subplot(2,3,3)
imagesc(grayimage_sharpen)
axis image
title('Gray sharpened')

% Display grayimage_boxblur in subplot(2,3,4) with square pixels and a title
subplot(2,3,4)
imagesc(grayimage_boxblur)
axis image
title('Gray box blurred')


% Display grayimage_edges in subplot(2,3,5) with square pixels and a title
subplot(2,3,5)
imagesc(grayimage_edges)
axis image
title('Gray edges')