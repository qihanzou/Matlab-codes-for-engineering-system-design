% Calculate the required membrane contact area
%% flow rate
%Q0=                                       %  m3/hr
%Q=Q0/60/60                                %  m3/s
%Q0=                                       %  m3/day
%Q=Q0/24/60/60                             %  m3/s
%Q0=                                       %  L/s
%Q=Q0/1000                                 %  m3/s
%Q0=                                       %  L/min
%Q=Q0/1000/60                              %  m3/s
%Q0=                                       %  L/hr
%Q=Q0/1000/60/60                           %  m3/s
%%
Area_req= 
% combination of membranes to use
% Vector list of membrane areas (m2)
A_mod = [1.1 2.17 4.15 8.43 12.41 30.31];

% Vector list of mnumber of membrane modules
N_mod = [0 0 0 2 0 0];

% Total combination of areas and area difference
% Difference of combo to required total. 
% Postive value, combo too large
% Negative value, combo too small
% -0.25m3<Adiff<+0.6m3
Area_comboV=sum(A_mod.*N_mod)
A_diff=Area_comboV-Area_req
%% Determine the total pressure drop of the membrane section
NumFiber=                         ;%number of Fibers
mu=                               ;%  viscosity of the fluid  (Pa s)  
rho=                              ;
IDfib=                            ;% in m
Lfib=                             ;% in m
%%
A_fib=pi*(IDfib)^2/4
g=9.81;
Q1=
v=Q1/(NumFiber*A_fib)        %m/s
Re=rho.*v.*IDfib./mu                            %  Reynolds number
%%   Darcy friction factor
if Re<2000
    f=64./Re                                 %  Laminar flow
else
    f=(1./(-1.8.*log10((6.9./Re)+((epsilon./IDfib)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end
%%
h_mem=(f.*Lfib.*v.^2)./(2.*IDfib.*g)                          %  head loss (m)
DP_mem=rho*g*h_mem                       %  pressure drop (Pa)
DP_mem_total=DP_mem*2











