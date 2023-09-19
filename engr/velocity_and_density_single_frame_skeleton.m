
% Code to calculate mean velocity for a single image frame
clear all
clc
close all

%% Load the mat file containing the 10 images
load('Ten_images.mat');



%% Extract a single frame from the 4-D image matrix
TestFrame = M(:,:,1,1);
% Display the single image frame in a (1,2,1)subplot
figure;
subplot(1,2,1)
imagesc(TestFrame);
axis image;
colormap gray;
title('Grayscale Testframe')

% Create binary mask of particle traces
TraceMask = (TestFrame>90);    %try different threshold values for your image to obtain masked streaks
% Display the single image frame binary mask in a (1,2,2)subplot
subplot(1,2,2)
imagesc(TraceMask);
axis image;
colormap gray;
title('Binary mask Testframe')

% Extract properties from mask 
CC = bwconncomp(TraceMask);

RP = regionprops(CC,'MajorAxisLength');
TraceLen = [RP.MajorAxisLength];

% Remove short trace lengths, (< 20 pixels)
Tracelen_1 = TraceLen(TraceLen>20);


%% Estimate mean particle velocity for a single frame
% 1. Camera resolution from calibration (from Workshop 8)and exposure time
C_per_pixel_m = 22.3*0.000001;         % camera resolution in m/pixel      
exposure_time_s = 500*10^(-3);       % exposure time in s 
% 2. Convert TraceLen_1 from pixels to m to obtain the vector of trace lengths
TraceLen_m = Tracelen_1*C_per_pixel_m;
% 3. Calculate velocities of the trace lengths, in m/s
Velocities_m_per_s = TraceLen_m/exposure_time_s;
% 4. Calculate mean velocity of the trace lengths in the single image frame, in m/s
mean_velocity_single_frame_m_per_sec = mean(Velocities_m_per_s) ;


%% Estimate particle density for a single frame
% 1. Calculate volume of torch beam, in cm3 
%    Note: You will first need to obtain the width and length of torch beam, 
%          in pixels, using getpts (use the torch_width_length file) 
width_of_torch_beam_cm =  1.26 ;    % width of torch beam in cm
length_of_torch_beam_cm =  2.41;   % length of torch beam in cm
depth_of_torch_beam_cm =   3;  % depth of torch beam in cm
volume_of_torch_beam_cm3 = depth_of_torch_beam_cm*length_of_torch_beam_cm*width_of_torch_beam_cm;   % volume of torch beam in cm^3

% 2. Calculate particle density of the single image frame, in patricles/cm3. 
% [Hint: use total number of traces in TraceLen]
particle_density_single_frame_per_cm3 = length(TraceLen)/volume_of_torch_beam_cm3;

%% display mean velocity and density of single frame
fprintf(1,'mean velocity of particles in Frame 1 = %7.4f m/s \n',mean_velocity_single_frame_m_per_sec)
fprintf(1,'desnity of particles in Frame 1 = %3.0f particles/cm3 \n',particle_density_single_frame_per_cm3)
