% Define absrough, rho, g and mu
rho=                                        %  density (kg/m^3) from g/ml to kg/m3 need to times 1000
D1=
D2=
D= [D1 D2]                                  %  diameter of pipe (m)
mu=                                         %  viscosity of the fluid  (Pa s)   
absrough=                                   %  surface roughness of the pipe  (m)
L=                                          %  length of the pipe (m)
k=                                          %  k-value for fittings
%%
Q0=                                         %  m3/hr
Q=Q0/60/60                                  %  m3/s
%Q0=                                       %  m3/day
%Q=Q0/24/60/60                             %  m3/s
%Q0=                                       %  L/min
%Q=Q0/1000/60                              %  m3/s
%Q0=                                       %  L/hr
%Q=Q0/1000/60/60                           %  m3/s
g=9.81       
%% :::k value for fittings:::
% 45. elbow  0.35
% 90. elbow  0.75
% 180. bend  1.5
% tee run through branch blocked   0.4
% tee all other flow patterns   1
% coupling   0.04
% union      0.04
% pipe exit  1
% pipe entrance  0.75
% Gate value     open  0.17
% Gate value 3/4 open  0.9
% Gate value 1/2 open  4.5
% Gate value 1/4 open  24

%% Calculate Q, A, v and Re
A=pi.*(D./2).^2
v=Q./A                                        %  velocity  (m/s)
Re=rho.*v.*D./mu                              %  Reynolds number
%
Re1=Re(1)
Re2=Re(2)
%% there are more than one Re, for if & else statemnet, they need to be calculated separatly for correct f. 
% Use if/else statement to determine flow regime and calculate f
if Re1<2000
    f1=64./Re1                                  %  Laminar flow
else
    f1=(1./(-1.8.*log10((6.9./Re1)+((absrough./D1)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end
if Re2<2000
    f2=64./Re2                                  %  Laminar flow
else
    f2=(1./(-1.8.*log10((6.9./Re2)+((absrough./D2)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end
f=[f1 f2]
% Calculate head loss and pressure drop over pipe
h_fitting=(v.^2*k)/(2.*g)                     %  fitting head loss (m)
DP_fitting=rho.*g.*h_fitting                  %  fitting pressure drop (Pa)
h_pipe=(f.*L.*v.^2)./(2.*D.*g)                %  pipe head loss (m)
DP_pipe=rho*g*h_pipe                          %  pipe pressure drop (Pa)

h_total=h_fitting+h_pipe                      %  total head loss (m)
DP_total=DP_fitting+DP_pipe                   %  total pressure drop (Pa)