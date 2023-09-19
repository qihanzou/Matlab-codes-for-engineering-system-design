
% Code to calibrate camera resolution
clear all
close all
clc

%% Load the calibration image - either using the mat file or tif image
% insert your image extraction code here
I=imread('camera_calibration_pic.tif');

%% Display the image (variable I in the Workspace) 
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
 [x,y]=getpts
 
 %% calculate resolution, um per pixel
 % 1. record length of calibration bar (between your two selected points)in cm
 length_of_calibration_bar_cm = 1
 % 2. find the number of pixels per calibration bar (by subtracting the x-coordinates of your two selected points) 
 no_of_pixels_per_calibration_bar = 448
 % 3. calculate camera resolution, in um per pixel
 C_um_per_pixel = 10000/448
