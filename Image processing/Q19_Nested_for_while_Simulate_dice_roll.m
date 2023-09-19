S=zeros(1,20000);
count=0
for n=1:length(S)
dice1=randi([1,6]);
dice2=randi([1,6]);
i=1;
doubles(i)=0;
while doubles(i)==0
if dice1==dice2
    doubles(i+1)=1;
else
    doubles(i+1)=0;
    count=count+1;
end
i=i+1;
end
S(n)=i;
n=n+1;
end

doubles_count=S
mean_count=mean(S)
std_count=std(S)