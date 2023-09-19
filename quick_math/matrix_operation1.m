function [C]=W520999(M)
%% Matrix:
M  ; %% matrix
%% eigenvalue:
[E,D]=eig(M); %% find D, the eigenvalues.
[i,j]=size(D); %% find the size of D (eigenvalue matrix).
for k=1:j %% let k be a index form 1 to the total number of columns of D (rows=cols, does not matter): It measns there has how many eigenvalues.
    a(k)=D(k,k) %% selets each eigenvalue and put into a matrix a with their index (order)
end
%% eigenvector:
for n=1:length(a) %% how many eigenvalues means how many eigenvectors, and the length of a from above geives the number of eigenvalues
    Z = null(rref(M-((a(n))*eye(size(M)))),'r'); %% find the solustion space of each eigenvalue/ find eigenvectors
    B{n}=Z;
end
C=[B{:}];
end