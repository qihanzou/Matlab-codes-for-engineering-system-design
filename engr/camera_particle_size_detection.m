% Code to detect particle size from microscope image
clear all
close all
clc

% Read microscope image into workspace, as variable I1
Load I_Particles_Camera.mat
I=I_Particles_Camera

C_ParticleMask = (I >180);
% Convert image into single layer grayscale image
I = mean(I,3);
% display grayscale image in a subplot
figure;
subplot(1,2,1);
imagesc(I);
axis image;
colormap gray;
title('Grayscale')

% Use the micropscope_calibration file to obtain the microscope resolution and record result here 
M_um_per_pixel = 8.6075;      % image resolution in µm/pixel      

% Select top 1000 pixels
I2 = I(1:1000,:);

% Create binary particle mask
M_ParticleMask = (I2<=100);  %threshold of intensity of 100 used
% display biary mask image in subplot
subplot(1,2,2);
imagesc(M_ParticleMask);
axis image;
colormap gray;
title('Binary mask')

% extract properties from mask 
CC = bwconncomp(M_ParticleMask);

RP = regionprops(CC,'Area','MajorAxisLength','MinorAxisLength');

Area = [RP.Area];
MajorLen = [RP.MajorAxisLength];
MinorLen = [RP.MinorAxisLength];

% average MajorLen and MinorLen vectors
M_Lengths = (MajorLen+MinorLen)/2;

% convert lengths and areas from pixels to um
M_Lengths_um = M_Lengths*M_um_per_pixel;
M_Areas_um2 = Area*M_um_per_pixel^2;

%remove the extra large and extra small particles (keep only particles
%between 100 and 10000 um2squared)
M_NewLengths = M_Lengths_um(M_Areas_um2>100 & M_Areas_um2 <10000);

% display a historgram using 20 bins and proper axes labels
figure;
histogram(M_NewLengths(:),20)
title('Microscope Particles')
xlabel('Average lengths (um)')
ylabel('Frequency')


% calculate mean of the lengths in um
M_NewAvLen = mean(M_NewLengths)