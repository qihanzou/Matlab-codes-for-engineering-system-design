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
NumFiber=                                 ;%  number of Fibers
mu=                                       ;%  viscosity of the fluid  (Pa s)  
rho=                                      ;
IDfib=                                    ;% ID of fibers in m
Lfib=                                     ;% length of fibers in m

A_fib=pi*(IDfib)^2/4
g=9.81;
v=Q/(NumFiber*A_fib)                       %m/s

Re=rho.*v.*IDfib./mu                            %  Reynolds number
%%%   Darcy friction factor
if Re<2000
    f=64./Re                                    %  Laminar flow
else
    f=(1./(-1.8.*log10((6.9./Re)+((epsilon./IDfib)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end

h_membrane=(f.*Lfib.*v.^2)./(2.*IDfib.*g)          %  head loss (m)
DP_membrane=rho*g*h_membrane                       %  pressure drop (Pa)



