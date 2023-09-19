%% clear workspace before starting
clc
clear
close all

%% 1. Read image into workspace and display onto a figure
I1 = imread('color_shapes.jpg');
% display original colour image
figure
imagesc(I1);
axis image;
colormap gray;
title('Original')
%% 2. Convert image into single layer grayscale image
I = mean(I1,3); %0 balck to 255 white
% display grayscale image
figure;
imagesc(I);
colormap gray;
title('Grayscale')
colorbar %intensity after averaging
%% 3. Create binary mask of objects
BinaryMask = (I<200); % 1 when <200 and 0 elsewhere, for image processing, only white binary objects with 1 are used
% display binary mask image
figure
imagesc(BinaryMask);
axis image;
colormap gray;
title('Binary mask');
colorbar
%% TASK
BinaryMaskAC= (I<110);
figure
imagesc(BinaryMaskAC);
axis image;
colormap gray;
title('Binary mask A C');
colorbar
%%
BinaryMaskABCDEH= (I<140);
figure
imagesc(BinaryMaskABCDEH);
axis image;
colormap gray;
title('Binary mask A B C D E H');
colorbar
%%
BinaryMaskFG= (I>160)&(I<170);
figure
imagesc(BinaryMaskFG);
axis image;
colormap gray;
title('Binary mask F G');
colorbar
%% 4. Extract properties from mask 
CC = bwconncomp(BinaryMask);
RP = regionprops(CC,'Area','MajorAxisLength','MinorAxisLength');

Area = [RP.Area];
MajorLen = [RP.MajorAxisLength];
MinorLen = [RP.MinorAxisLength];
%% print properties of objects detected Area, Major axis length and Minor
 % Axis length for team discussion

fprintf(1, ' #ID |    Area     | Major Axis length | Minor Axis length |\n');
fprintf(1, '     |  (pixels)   |     (pixels)      |     (pixels)      |\n');
fprintf(1, '-----------------------------------------------------------|\n');
for i = 1:length(Area)
fprintf(1, ' %2d  | %11.2f | %17.4f | %17.4f |\n',i,Area(i), MajorLen(i),MinorLen(i));
end


%% Remove objects with certain property

NewArea = Area(Area>8000);
NewMajorLen = MajorLen(Area>8000);
NewMinorLen = MinorLen(Area>8000);

fprintf(1,'\n\n After removing objects of certain property \n');
fprintf(1, ' #ID |    Area     | Major Axis length | Minor Axis length |\n');
fprintf(1, '     |  (pixels)   |     (pixels)      |     (pixels)      |\n');
fprintf(1, '-----------------------------------------------------------|\n');
for i = 1:length(NewArea)
fprintf(1, ' %2d  | %11.2f | %17.4f | %17.4f |\n',i,NewArea(i), NewMajorLen(i),NewMinorLen(i));
end

