
% Code to measure width and length of torch beam
clear all
close all
clc

%% Load the mat file containing the 10 images
load('Ten_images.mat');

%% Extract a single frame from the 4-D image matrix and display
I = M(:,:,1,1);
% display the single image frame
figure
imagesc(I);
axis image
colormap gray
%{
figure;
for k = 1:1:10;
    figure;
imagesc(M(:,:,1,k));
colormap gray;
axis image;
title(['Image frame ',num2str(k)]); pause(0.5);
end;
imagesc(I);
axis image
colormap gray
%}
%{
%% use getpts to select 2 points on selected image to find width of torch beam in pixels
 disp('getpts is requesting for input to measure width of torch beam.')
 disp('Use normal button clicks to add points.  A double-click adds a final point and ends the selection.')  
 disp('Pressing RETURN or ENTER ends the selection without adding a final point.')
 disp('Pressing BACKSPACE or DELETE removes the previously selected point.')
 disp('Coordinates of the selected points are returned in the vectors X and Y.') 

% insert your getpts code here to read points into vectors x1 and y1
 


% find width of torch beam, in pixels 
 width_of_torch_beam_pixels = 
 
%% use getpts to select 2 points on selected image to find length of torch beam in pixels
 
 disp('getpts is requesting for input to measure length of torch beam.')

 % insert your getpts code here to read points into vectors x2 and y2
 
 
 % find length of torch beam, in pixels 
 length_of_torch_beam_pixels = 
 %}
 
