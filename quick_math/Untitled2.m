clc
    clear
    syms x
    B=[x 0 0;0 x 0;0 0 x];

    i=1;
    while true
        A(:,:,i)=randi([0 1],3,3);
        if (2*A(1,1,i)<=(A(1,2,i)+A(2,1,i))) && (A(1,1,i)<=A(2,2,i) && A(1,1,i)<=A(3,3,i)) && (A(1,1,i)+A(2,1,i)<=A(2,3,i)+A(3,1,i)) && (A(1,1,i)+A(3,1,i)<=(A(3,2,i)+A(2,1,i)))
            i=i+1;
        end
        if i==10;break;end % times of run
    end

    for n=1:(i-1)
        K=A(:,:,n);                                    
        C=K-B;
        eqn=det(C)
    end