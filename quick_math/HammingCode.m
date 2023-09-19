%% some task operations, just ignored it
A=[1 0 1 1 0;1 1 1 0 0;0 1 1 1 1;1 1 0 0 1];
x=[1;0;1;1;0];
rrefmod2(A);
mod(A*x,2);
%% Basic Hamming Code H: a 3*7 matrix:
H=[1 0 1 0 1 0 1;0 1 1 0 0 1 1;0 0 0 1 1 1 1];
%% find the basis for H
rrefmod2(H); % first reduce rref H in mod2
%% This is a checking step that check H*vi=0, should in mod2:
v1=[0;0;0;0;0;1;1];
v2=[1;1;0;0;1;0;1];
v3=[1;0;1;0;1;1;0];
v4=[1;0;0;1;1;1;1];
H1=mod(H*v1,2);
H2=mod(H*v2,2);
H3=mod(H*v3,2);
H4=mod(H*v4,2);
%% The Generating matrix of the code, it is used to find the new codewords:
%% G, should be same when operate different orignal codewords:
G=[v1 v2 v3 v4]; % defined G
rrefmod2(G) ; % this is a chekcing step, can be ignored 
%% The Method to find new codewords from original codewords:
%% Operations should in mod2:
%% eg. 'stuv' should in 's' form.
%%                       t
%%                       u
%%                       v
%% Method: G*[original codewords in above form] in mod2:
%% This make the original codewords whih 4 bits get 3 more bits (the checking bits):
mod(G*[4;5;6;7],2) % types original codeword here, should be up to 4 entries.














