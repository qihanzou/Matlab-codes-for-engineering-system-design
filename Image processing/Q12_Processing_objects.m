% Use imread to read the image into original image matrix, I
I = imread('stripes.jpg');

% Convert 3-channel colour image to grayscale image
grayimage = mean(I,3);

% Set the threshold to 50 and create a binary mask
threshold = 50;
binary_mask = (grayimage<50);

% Display grayimage in subplot(2,2,1) with square pixels, a gray colormap and a title
subplot(2,2,1)
imagesc(grayimage)
axis image
colormap gray
title('Grayscale')

% Display the binary mask in subplot(2,2,2) with square pixels and a title
subplot(2,2,2)
imagesc(binary_mask)
axis image
title('Binary mask')

% Find connected components and extract the areas and lengths of the objects
CC = bwconncomp(binary_mask);
RP = regionprops(CC,'Area','MajorAxisLength');
Area = [RP.Area];
Length = [RP.MajorAxisLength];

% Remove the lengths of objects which areas are less than or equal to 100 pixels
Stripe_Lengths = Length(Area>100);

% Plot a histogram of the stripe lengths into subplot(2,2,[3 4]) with 10 bins and xlabel, ylabel and title
subplot(2,2,[3 4])
histogram(Stripe_Lengths,10)
xlabel('Stripe lengths (pixels)')
ylabel('Frequency')
title('Black stripe lengths')

% Find the mean of the stripe lengths
mean_Stripe_Lengths = mean(Stripe_Lengths);
std_dev_Stripe_Lengths = std(Stripe_Lengths);

% If the mean of the stripe lengths is 5.5 cm, calculate the camera resolution in mm per pixel
resolution_in_mm_per_pixel = (5.5*10)/mean_Stripe_Lengths;