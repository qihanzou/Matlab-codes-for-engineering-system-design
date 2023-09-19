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
NumFiber13=              ;%number of Fibers
NumFiber20=
mu=                                    ;%  viscosity of the fluid  (Pa s)  
rho=                                       ;
IDfib=                            ;% in m
Lfib13=                            ;% in m
Lfib20=

A_fib=pi*(IDfib)^2/4
g=9.81;

v1=Q/(NumFiber13*A_fib)        %m/s
Re1=rho.*v1.*IDfib./mu                            %  Reynolds number
%%%   Darcy friction factor
if Re1<2000
    f1=64./Re1                                 %  Laminar flow
else
    f1=(1./(-1.8.*log10((6.9./Re1)+((epsilon./IDfib)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end
h_membrane1=(f1.*Lfib13.*v1.^2)./(2.*IDfib.*g)                          %  head loss (m)
DP_membrane1=rho*g*h_membrane1                       %  pressure drop (Pa)

v2=Q/(NumFiber20*A_fib)        %m/s
Re2=rho.*v2.*IDfib./mu                            %  Reynolds number
%%%   Darcy friction factor
if Re2<2000
    f2=64./Re2                                 %  Laminar flow
else
    f2=(1./(-1.8.*log10((6.9./Re2)+((epsilon./IDfib)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end
h_membrane2=(f2.*Lfib20.*v2.^2)./(2.*IDfib.*g)                          %  head loss (m)
DP_membrane2=rho*g*h_membrane2                       %  pressure drop (Pa)

DP_membrane_total=DP_membrane1+DP_membrane2









