% Define K_1, K_2 and K_3
K_1 = [1 0 1 0];
K_2 = [0 0 0 1];
K_3 = [0 1 1 0];

% Use imagesc to display vector K_1 into subplot(2,2,1) with square pixels and a gray colormap
subplot(2,2,1)
imagesc(K_1)
axis image
colormap gray


% Use imagesc to display vector K_2 into subplot(2,2,2) with square pixels
subplot(2,2,2)
imagesc(K_2)
axis image
colormap gray


% Use imagesc to display vector K_3 into subplot(2,2,3) with square pixels
subplot(2,2,3)
imagesc(K_3)
axis image
colormap gray


% Define a new matrix K
K = [K_1;K_2;K_3];

% Use imagesc to display matrix K into subplot(2,2,4) with square pixels and include a colorbar
subplot(2,2,4)
imagesc(K)
axis image
colormap gray
colorbar