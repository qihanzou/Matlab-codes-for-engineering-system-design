% Read the video into variable M
vid = VideoReader('dots.mp4');
M = read(vid);
clear vid

% Convert the colour video M to a grayscale video with the mean function
grayvideo = mean(M,3);

% Report the duration of the entire video in seconds
frames_per_second=12
video_duration =size(M,4)/frames_per_second;

% Construct a for loop to look through grayvideo and find the frame with most circles
% Use the code below to find the centres of the circles in image in the loop
max_circles = zeros(1,size(grayvideo,4));
max_frame = 1;
for i = 1:size(grayvideo,4) 
image = grayvideo(:,:,i);
centres = imfindcircles(image, [15 20], 'Sensitivity', 0.95, 'ObjectPolarity', 'bright');
x =length(centres);
if max_circles < x 
    max_circles(i)= length(centres);
max_frame = i;
end 
end
 
% Display the first frame with the most circles with square pixels, gray colormap and title
imagesc(grayvideo(:,:,max_frame));
axis image;
colormap gray;
title('Max circles grayscale')









