% Long row vector of random numbers A
A = randi([0 9],1,randi([1000 1500]));

% Determine vector B with a while loop
B=zeros(size(A))
n=1
while n<length(A)
    B(n)=A(n)>=A(n+1)
    n=n+1