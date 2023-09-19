% Use imread to read the image into original image matrix, I
I = imread('feelsbadman.jpg');

% Display I in subplot(1,3,1) and set square pixels
subplot(1,3,1)
imagesc(I)
axis image
title('Original')

% Convert 3-channel colour image to grayscale image
grayimage = mean(I,3);

% Display N in subplot(2,3,6) with square pixels, a gray colormap and a title
subplot(1,3,2)
imagesc(grayimage)
axis image
colormap gray
title('Grayscale')

% Find the height, width and total number of pixels of image grayimage
pixel_height = size(grayimage,1);
pixel_width = size(grayimage,2);
number_of_pixels = numel(grayimage)

% Find the pixel intensity at (150,80) of grayimage
intensity_at_150_80 = grayimage(150,80);

% Determine the average pixel intensity of grayimage
avg_intensity = mean(mean(grayimage));

% Create a binary mask of the pixels that exceed the intensity threshold of 170
threshold = 170;
gray_mask = (grayimage>threshold);

% Display the binary mask using imagesc in subplot (1,3,3) with square pixels and a gray colormap and title
subplot(1,3,3)
imagesc(gray_mask)
axis image
colormap gray
title('Binary mask')

% Determine the fraction of pixels with intensity exceeding 170
no_of_pixels_with_intensity_exceeding_170 = sum(sum(gray_mask))
fraction_of_pixels_with_intensity_exceeding_170 = no_of_pixels_with_intensity_exceeding_170/number_of_pixels

% Determine the sum of the pixel intensities that have intensity less than or equal to 170
threshold2 = 170;
gray_mask2 =grayimage(grayimage<=threshold2)
%gray_mask2 = grayimage.*(grayimage<=threshold2);
sum_of_pixels_with_intensity_below_or_equal_to_170 =sum(sum(gray_mask2))
