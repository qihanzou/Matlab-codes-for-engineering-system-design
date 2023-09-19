% Use imread to read the image into original image matrix, I
I = imread('davies.jpg');

% Find the height, width and total number of pixels of image I
pixel_height = size(I,1);
pixel_width = size(I,2);
number_of_pixels = pixel_height*pixel_width;

% Find the blue channel intensity at (50,150)
blue_intensity_at_50_150 = I(50,150,3);

% Create a copy of I into J and scalar multiply J by 0.7
J = I;
J(:,:,1) = 0.7.*I(:,:,1);

% Cut out a rectangular section of I and J using array indexing. Corners at (200,400) and (250,500)
section_I = I(200:250,400:500,:);
section_J = J(200:250,400:500,:);

% Display I in subplot(2,2,1) and set square pixels
subplot(2,2,1)
% insert plot command here
imagesc(I)
axis image

% Plot original red channel frequency of forehead section with 15 bins in subplot(2,2,2). Add title and labels.
subplot(2,2,2)
% insert histogram command, titles and labels here
histogram(section_I(:,:,1),15)
title('Original red channel')
xlabel('Intensity')
ylabel('Frequency')

% Display J in subplot(2,2,3) and set square pixels
subplot(2,2,3)
% insert plot command here
imagesc(J)
axis image

% Plot modified red channel frequency of forehead section with 15 bins in subplot(2,2,4). Add title and labels.
subplot(2,2,4)
% insert histogram command, titles and labels here
histogram(section_J(:,:,1),15)
title('Modified red channel')
xlabel('Intensity')
ylabel('Frequency')