S=[1 2]
while S(length(S))<50000
    n=length(S)
    if 0<=S(n) & S(n)<10
        c=1
    end
    if 10<=S(n) & S(n)<100
            c=4
    end
    if 100<=S(n) & S(n)<1000
            c=512
    end
    if 1000<=S(n) & S(n)<10000
            c=4096
    end
    if S(n)>10000
            c=8192
    end
S(n+1)=(S(n)*S(n-1))/c
n=n+1
end
S_length = length(S)