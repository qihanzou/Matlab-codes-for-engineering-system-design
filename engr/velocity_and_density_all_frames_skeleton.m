
% for loop to calculate mean_velocity and particle density for all frames 
clear all
clc
close all

%% Load the mat file containing the 10 images
 load('Ten_images.mat');

%% Calculate mean velocity and particle density for 10 frames using a for loop
for i =1:1:10
    TestFrame = M(:,:,1,i);    % Extract a single frame from the 4-D image matrix
    % display each image frame in a subplot in a new figure
    figure 
    subplot(1,2,1)
    imagesc(TestFrame);
    axis image;
    colormap gray;
    title(['Grayscale Frame ',num2str(i)]);
    

    
    % Create binary mask of particle traces
    TraceMask = (TestFrame>90);    %try different threshold values for your image to obtain masked streaks
    % display the respective binary mask in a subplot 
    subplot(1,2,2)
    imagesc(TraceMask);
    axis image;
    colormap gray;
    title(['Binary mask Frame ',num2str(i)]);
    
    % extract properties from mask 
    CC = bwconncomp(TraceMask);
    RP = regionprops(CC,'MajorAxisLength');
    TraceLen = [RP.MajorAxisLength];
    
    % remove short trace lengths, (< 20 pixels)
    TraceLen_1=TraceLen(TraceLen>20);
    
    % estimate mean particle velocity for each frame
    % 1. camera resolution from calibration (from Workshop 8)and exposure time
    C_per_pixel_m = 22.3*0.000001;        % image resolution in m/pixel      
    exposure_time_s = 500*10^(-3);      % exposure time in s 
    % 2. convert TraceLen_1 from pixels to m to obtain the vector of trace lengths
    TraceLen_m = TraceLen_1*C_per_pixel_m;
    % 3. calculate velocities of the trace lengths, in m/s
    Velocities_m_per_s = TraceLen_m/exposure_time_s;
    % 4. calculate mean velocity of the trace lengths in each image frame, in m/s
    %    and store result in a row vector [Hint: use array indexing] 
    % insert your code here
    mean_velocity_all_frames_m_per_sec(i) = mean(Velocities_m_per_s)
    
    % estimate particle density for each frame
    % 1. calculate volume of torch beam, in cm3 
    %    Note: You will first need to obtain the width and length of torch beam, 
    %          in pixels, using getpts (use the torch_width_length file) 
    width_of_torch_beam_cm = 1.26;     % width of torch beam in cm
    length_of_torch_beam_cm = 2.41;    % length of torch beam in cm
    depth_of_torch_beam_cm = 3;     % depth of torch beam in cm
    volume_of_torch_beam_cm3 = depth_of_torch_beam_cm*length_of_torch_beam_cm*width_of_torch_beam_cm;   % volume of torch beam in cm^3
    % 2. calculate particle density in each frame, in patricles/cm3
    %    and store result in a row vector [Hint: use array indexing]   
    % insert your code here
    particle_density_all_frames_per_cm3(i) = length(TraceLen)/volume_of_torch_beam_cm3;
end

%% Display velocities and densities of all frames
frame_number=1:10;
display=[frame_number; mean_velocity_all_frames_m_per_sec; particle_density_all_frames_per_cm3];
fprintf(1,'\n frame number   mean velocity(m/s)   particle density(/cm3) \n')   
fprintf(1,'%7.0f %18.4f %20.0f \n',display)