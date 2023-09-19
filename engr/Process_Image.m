function[particle_density_single_frame_per_m3] = Process_Image(TestFrame);
TraceMask = (TestFrame>90);    %try different threshold values for your image to obtain masked streaks
% Display the single image frame binary mask in a (1,2,2)subplot
figure
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
particle_density_single_frame_per_m3=particle_density_single_frame_per_cm3/100/100/100
%% display density of single frame

fprintf(1,'desnity of particles in Frame = %3.0f particles/cm3 \n',particle_density_single_frame_per_m3)