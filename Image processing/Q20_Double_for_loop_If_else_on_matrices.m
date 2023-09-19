% Matrix of random numbers P
P = randi([0 9],randi([400 600]),randi([400 600]));
S=zeros(size(P));
% Write a double for loop to check elements of P and store results in S
for n=1:1:size(P,1)
    for m=1:1:size(P,2)
        if P(n,m) <3;
            S(n,m)=-1;
        end
        if P(n,m) >= 3 & P(n,m) < 7
                S(n,m)=0;
        end
        if P(n,m)>=7
            S(n,m)=1;
        end
    end
end