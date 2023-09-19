% Read the video into variable M
vid = VideoReader('dots.mp4');
M = read(vid);
clear vid


% Convert the colour video M to a grayscale video with the mean function
grayvideo = mean(M,3); % average the video's frame to gray, not whole video, hence dim=3

% Report the duration of the entire video in seconds
frames_per_second=12;
video_duration =size(M,4)/frames_per_second; % number of frames/fames per second = the time

% Construct a for loop to look through grayvideo and find the frame with most circles
% Use the code below to find the centres of the circles in image in the loop
max_circles = zeros(1,36); % create a vetor to store the results

for i = 1:size(grayvideo,4) % from the first frame to the last frame
image = grayvideo(:,:,i); %selet frame from 1 to the last frame
centres = imfindcircles(image, [15 20], 'Sensitivity', 0.95, 'ObjectPolarity', 'bright'); % find objects that meet the requiremnet
x =length(centres); % centres is a vector of the postion of circles center, the length of this vector (the number of center) give the number of circles 
max_circles(1,i) = x; % store the number of circles into the vector that created before, max_circles
end

[max_frame,postion_of_the_max_frame] = max(max_circles); % find the max number of circles in max_circles and the postion of the max number of circles

% Display the first frame with the most circles with square pixels, gray colormap and title
imagesc(grayvideo(:,:,max_frame)); % the frame with most circles
axis image;
colormap gray;
title('Max circles grayscale')



