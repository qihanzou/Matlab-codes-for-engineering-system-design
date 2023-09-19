% Write a for loop to calculate z0_30
z0_30 = zeros([1,31])
for n = 1:30
z0_30(1,n+1) = 5*z0_30(1,n)+1;
n = n+1;
end

% Plot z0_30 in subplot(1,2,1) and add a title
subplot(1,2,1)
plot(z0_30)
title('z after 30 iterations (z_0=0)')

% Write a for loop to calculate z3_25
z3_25 = zeros([1,26])
z3_25(1,1)=3
for n=1:25
z3_25(1,n+1)=5*z3_25(1,n)+1
n=n+1
end

% Plot z3_25 in subplot(1,2,2) and add a title
subplot(1,2,2)
plot(z3_25)
title('z after 25 iterations (z_0=3)')
