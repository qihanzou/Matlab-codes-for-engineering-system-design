% Define absrough, rho, g and mu
rho=998                                        %  density (kg/m^3)
D1=150*10^-3                                         %  diameter of pipe (m) before reducer
D2=75*10^-3                                         %  diameter of pipe (m) after reducer
mu=1*10^-3                                         %  viscosity of the fluid  (Pa s)   
absrough=70*10^-6                                   %  surface roughness of the pipe  (m)
L_150=10+15                                         %  length of the pipe before reducer (m)
%L_par=                                         %  length of the pipe after reducer

%Q0=                                       %  m3/hr
%Q=Q0/60/60                                %  m3/s
%Q0=                                       %  m3/day
%Q=Q0/24/60/60                             %  m3/s
%Q0=                                       %  L/s
%Q=Q0/1000                                 %  m3/s
Q0=200                                       %  L/min
Q=Q0/1000/60                              %  m3/s
%Q0=                                       %  L/hr
%Q=Q0/1000/60/60                           %  m3/s
g=9.81            
% :::k value for fittings:::
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

% Calculate Q, A, v and Re
A_150=pi*(D1/2)^2
v_150=Q/A_150                                        %  velocity  (m/s)
Re_150=rho.*v_150.*D1./mu                            %  Reynolds number
% Use if/else statement to determine flow regime and calculate f
if Re_150<2000
    f_150=64./Re_150                                 %  Laminar flow
else
    f_150=(1./(-1.8.*log10((6.9./Re_150)+((absrough./D1)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end
K_150=0.75+0.75+1
h_fit2=(v_150.^2*K_150)/(2.*g)                     %  fitting head loss (m)
DP_fit2=rho*g*h_fit2                 %  fitting pressure drop (Pa)

h_pipe2=(f_150.*L_150.*v_150.^2)./(2.*D1.*g)               %  pipe head loss (m)
DP_pipe2=rho*g*h_pipe2                          %  pipe pressure drop (Pa)

if Re_150<2000
    a1=2                                      %  Laminar
else
    a1=1                                      %  turbulent
end

h1=23
h2=8
P1=101325
P2=rho*g*(h1-h2)+P1-a1*rho*v_150^2/2-DP_pipe2-DP_fit2

Q2=Q
A2_150=pi*(D1/2)^2
v2_150=Q/A2_150                                        %  velocity  (m/s)
Re2_150=rho.*v2_150.*D1./mu                            %  Reynolds number
if Re2_150<2000
    f2_150=64./Re2_150                                 %  Laminar flow
else
    f2_150=(1./(-1.8.*log10((6.9./Re2_150)+((absrough./D1)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end

if Re2_150<2500
    K_red=(1.2+(160./Re2_150)).*((D1./D2).^4-1)
else
    K_red=(0.6+0.48.*f2_150).*(D1./D2).^2.*((D1./D2).^2-1)
end

A_75=pi*(D2/2)^2
Q_par=Q2/2                                        %  velocity  (m/s)
v_75=Q_par/A_75
Re_75=rho.*v_75.*D2./mu                            %  Reynolds number

if Re_75<2000
    f_75=64./Re_75                                 %  Laminar flow
else
    f_75=(1./(-1.8.*log10((6.9./Re_75)+((absrough./D2)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end

L3=8
L4=100+8
k3=K_red+0.17+1
k4=K_red+0.17+1+0.75

h_fit3=(v_75.^2*k3)/(2.*g)                     %  fitting head loss (m)
DP_fit3=rho*g*h_fit3                 %  fitting pressure drop (Pa)
h_pipe3=(f_75.*L3.*v_75.^2)./(2.*D2.*g)               %  pipe head loss (m)
DP_pipe3=rho*g*h_pipe3                          %  pipe pressure drop (Pa)
DP_total3=DP_pipe3+DP_fit3

if Re2_150<2000
    a2=2                                      %  Laminar
else
    a2=1                                      %  turbulent
end
if Re_75<2000
    a3=2                                      %  Laminar
else
    a3=1                                      %  turbulent
end
h3=0
P3=a2*rho*(v2_150)^2/2+rho*g*(h2-h3)+P2-a3*rho*(v_75)^2/2-DP_total3

h_fit4=(v_75.^2*k4)/(2.*g)                     %  fitting head loss (m)
DP_fit4=rho*g*h_fit4                 %  fitting pressure drop (Pa)
h_pipe4=(f_75.*L4.*v_75.^2)./(2.*D2.*g)               %  pipe head loss (m)
DP_pipe4=rho*g*h_pipe4                          %  pipe pressure drop (Pa)
DP_total4=DP_pipe3+DP_fit4

h4=0
P4=a2*rho*(v2_150)^2/2+rho*g*(h2-h4)+P2-a3*rho*(v_75)^2/2-DP_total4











































































