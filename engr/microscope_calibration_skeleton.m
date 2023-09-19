
% Code to calibrate microscope resolution. 
clear all
close all
clc

%% Load the Particles_Microscope image file
% The microscope calibration scale is given at the bottom right hand 
% corner of the Particles_Microscope.tif image
I=imread('Particles_Microscope.tif');
% insert code to read the microscope image file into variable I. 


% display image
figure
imagesc(I)
axis image
colormap gray

%% use getpts to select 2 points on calibration image
 disp('getpts is requesting for input.')
 disp('Use normal button clicks to add points.  A double-click adds a final point and ends the selection.')  
 disp('Pressing RETURN or ENTER ends the selection without adding a final point.')
 disp('Pressing BACKSPACE or DELETE removes the previously selected point.')
 disp('Coordinates of the selected points are returned in the vectors x and y.') 

% insert your getpts code here to read points into vectors x and y
[x y]=getpts
 
 %% calculate resolution, um per pixel
 % 1. record length of calibration bar (between your two selected points)in um
 length_of_calibration_bar_um = 500
 % 2. find the number of pixels per calibration bar (by subtracting the x-coordinates of your two selected points) 
 no_of_pixels_per_calibration_bar = 
 % 3. calculate microscope resolution, in um per pixel
 M_um_per_pixel = length_of_calibration_bar_um/no_of_pixels_per_calibration_bar
