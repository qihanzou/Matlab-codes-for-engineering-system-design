% Load in the video file:
load Q24_Video;

% 1. Find the number of image frames in Q24_Video, using the function size.  Assign this value to the variable N:
N = size(Q24_Video,4)

% 2. Count the number of white pixels (intensity value = 1) in the first image frame:
numWhite = sum(sum(Q24_Video(:,:,:,1)))

% 3. Use a while loop to determine the first image frame, n, that contains more than 30 white pixels:
i=1
while i<N
    numWhite(i) = sum(sum(Q24_Video(:,:,:,i)))
    if numWhite(i)>30
        n=i
        break
    end
    i=i+1
end