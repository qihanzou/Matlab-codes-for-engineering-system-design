%% clear workspace before starting
clc
clear
close all

%% Read image into workspace and display onto a figure
% insert code here
I1=imread('image1.jpg');
% display original colour image
figure
imagesc(I1);
axis image;
colormap gray;
title('Original')

%% Convert image into single layer grayscale image
% insert code here;
I=mean(I1,3);
% display grayscale image
figure;
imagesc(I);
axis image;
colormap gray;
title('Grayscale')
colorbar

%% Create binary mask of objects
% insert code here
BinaryMask = (I>50);
% display binary mask image
figure
imagesc(BinaryMask);
axis image;
colormap gray;
title('Binary mask')
colorbar

%% Extract properties from mask 

CC = bwconncomp(BinaryMask);
RP = regionprops(CC,'Area','MajorAxisLength','MinorAxisLength');

Area = [RP.Area];
MajorLen = [RP.MajorAxisLength];
MinorLen = [RP.MinorAxisLength];

%% print properties of objects detected Area, Major axis length and Minor
 % Axis length for team discussion
fprintf(1,'\n\n Properties of objects \n');
fprintf(1, ' #ID |    Area     | Major Axis length | Minor Axis length |\n');
fprintf(1, '     |  (pixels)   |     (pixels)      |     (pixels)      |\n');
fprintf(1, '-----------------------------------------------------------|\n');
for i = 1:length(Area)
fprintf(1, ' %2d  | %11.2f | %17.4f | %17.4f |\n',i,Area(i), MajorLen(i),MinorLen(i));
end


%% Remove objects that are not relevant

NewArea =Area(Area>10000); 
NewMajorLen = MajorLen(Area>10000);
NewMinorLen = MinorLen(Area>10000);


fprintf(1,'\n\n After removing objects of certain property \n');
fprintf(1, ' #ID |    Area     | Major Axis length | Minor Axis length |\n');
fprintf(1, '     |  (pixels)   |     (pixels)      |     (pixels)      |\n');
fprintf(1, '-----------------------------------------------------------|\n');
for i = 1:length(NewArea)
fprintf(1, ' %2d  | %11.2f | %17.4f | %17.4f |\n',i,NewArea(i), NewMajorLen(i),NewMinorLen(i));
end


%% Extra - Plotting only filtered objects
%{
RPx = regionprops(CC,'Image','BoundingBox'); %image and bounding box extra properties to extract
Image = {RPx.Image};
BoundingBox = {RPx.BoundingBox};
NewImage = Image( );   % apply the same threshold used to to remove the unwanted objects as above. e.g.(Area > 50) and (MajorLen > 100)
NewBoundingBox = BoundingBox( );  % apply the same threshold used to to remove the unwanted objects as above. e.g.(Area > 50) and (MajorLen > 100)

SingleLineMask = zeros(size(BinaryMask,1),size(BinaryMask,2),length(NewArea));
for ii = 1:length(NewArea)
    bound = NewBoundingBox{ii};
    bound_rows = bound(2)+0.5:(bound(2)+bound(4)-0.5);
    bound_cols = bound(1)+0.5:(bound(1)+bound(3)-0.5);
    SingleLineMask(bound_rows,bound_cols,ii) = NewImage{ii};
end
LineMask = sum(SingleLineMask,3);

figure
imagesc(LineMask);
axis image;
colormap gray;
title('Binary Mask of filtered objects')
colorbar
%}

%% Calculate velocity and average velocity

resolution = 0.002;     % m per pixel
exposure_time = 0.2;    % seconds

velocity = NewMajorLen*resolution/exposure_time;

fprintf(1,'\n\n Calculating velocities \n');
fprintf(1, ' #ID |    Area     | Major Axis length |  resolution  | exposure time | velocity |\n');
fprintf(1, '     |  (pixels)   |     (pixels)      |(m per pixels)|   (seconds)   |  (m/s)   |\n');
fprintf(1, '---------------------------------------------------------------------------------|\n');
for i = 1:length(NewArea)
fprintf(1, ' %2d  | %11.2f | %17.4f | %12.4f | %13.4f | %8.4f |\n',i,NewArea(i), NewMajorLen(i),resolution,exposure_time, velocity(i));
end

average_velocity = mean(velocity)
