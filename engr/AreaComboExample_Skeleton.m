% This M file is a tool to calcualte the number of different types of
% Membranes to meet a required area.

Q=  2.7697          %m3/hr
Area_required= 2.7987.*Q

%Vector list of membrane Areas
A_Mod=[1.1 2.17 4.15 8.43 12.41 30.31]
%Vector list of number of membrane modules
N_Mod=[0 0 2 0 0 0];

% Total of combination of areas

Area_comboV=sum(A_Mod.*N_Mod)

% Difference of combo to required total. 
% Postive value, combo too large
% Negative value, combo too small
DiffAV=Area_comboV-Area_required


