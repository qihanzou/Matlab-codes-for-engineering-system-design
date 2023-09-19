% Use imread to read the image into original image matrix, I
I = imread('gumballs.jpg');

% Convert 3-channel colour image to grayscale image
grayimage = mean(I,3);

% Display grayimage in subplot(1,2,1) with square pixels, a gray colormap and a title
subplot(1,2,1)
imagesc(grayimage)
axis image
colormap gray
title('Grayscale')

% Set minimum and maximum circle radii
Rmin = 20;
Rmax = 45;

% Use imfindcircles to identify the centres and radii of circles in grayimage
[G_centres, G_radii] = imfindcircles(grayimage, [Rmin Rmax], 'Sensitivity', 0.95, 'ObjectPolarity', 'bright');

% Overlay the image with blue circles using the viscircles function 
viscircles(G_centres,G_radii,'Color','b');

% Plot a histogram of the circle radii with 15 bins and xlabel, ylabel and title
subplot(1,2,2)
histogram(G_radii,15)
xlabel('Radius (px)')
ylabel('Frequency')
title('Radii (sens = 0.95)')

% Calculate the mean and standard deviation of the radii
radii_mean = mean(G_radii);
radii_std_dev = std(G_radii);
