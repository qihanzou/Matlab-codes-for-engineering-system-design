tic;
% close all figures and clear the workspace
close all
clear all

% Place 'tic' to time the code.  One of the last steps in this workshop.

%% First, acquire and process 1 image before beginning the while loop
% initialise video object - include ReadTime and CurrentTime
% to specify when to start reading video file
ReadTime = 2;

vid = VideoReader('particles.mp4','CurrentTime',ReadTime);  

% acquire single video frame (TestFrameI) 
% and average to grayscale (TestFrame)
TestFrameI = readFrame(vid);
TestFrame = mean(TestFrameI,3);

% process the single frame by using the Process_Image function
[Particle_mean_velocity, Particle_density] = Process_Image(TestFrame);

figure;
imagesc(TestFrame);
axis image;
colormap gray;
title('Image frame 1');

% display only the result of interest - particle density 
fprintf('Particle density = %d \n',floor(Particle_density)); 
fprintf('Frame %d completed.\n\n','Image frame 1'); 

% display the first acquired frame
figure;
imagesc(TestFrame);
axis image;
colormap gray;
title('Image frame 1')
fprintf('Frame 1 completed.\n\n');

% 4.b. initialise counter variable, framenum, to 1 
framenum = 1;

% 4.e. set a threshold value for particle density
Threshold = 13.16;

while Particle_density<Threshold % insert your condition here-while particle density is less than threshold
   
    % acquire new single frame into variable TestFrame
    TestFrameI = readFrame(vid);
    TestFrame = mean(TestFrameI,3);
    % process the SingleFrame using the Process_Image function
    [Particle_mean_velocity, Particle_density] = Process_Image(TestFrame); 
        
    % increment framenum by 1 for each iteration
    framenum = framenum + 1;
    
    % display subsequent acquired frames for each iteration
    
    
    % display particle density and number of frames completed for each
    % iteration
    fprintf('Particle density = %d \n',floor(Particle_density)); 
    fprintf('Frame %d completed.\n\n',framenum); 
    
end

ElapsedTime = toc;   % 'toc' to time the code

% Display message as per the workshop handout:
fprintf('In total, %d frames completed in %f seconds.\n',framenum,ElapsedTime);
fprintf(2, "WARNING! Particle threshold exceeded. \n\n") 
