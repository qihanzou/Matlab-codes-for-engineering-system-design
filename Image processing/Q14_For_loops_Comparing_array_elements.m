% Long row vector of random numbers A
A = randi([0 9],1,randi([1000 1500]));

% Determine vector B with a for loop
B = zeros(1,length(A));
for i = 1:length(A)-1
B(i)= (A(i)>=A(i+1));
i = i+1;
end
B