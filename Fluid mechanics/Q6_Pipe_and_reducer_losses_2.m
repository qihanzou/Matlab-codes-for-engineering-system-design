% Define absrough, rho, g and mu
rho=                                        %  density (kg/m^3)
D1=                                         %  diameter of pipe (m) before reducer
D2=                                         %  diameter of pipe (m) after reducer
mu=                                         %  viscosity of the fluid  (Pa s)   
absrough=                                   %  surface roughness of the pipe  (m)
L1=                                         %  length of the pipe before reducer (m)
L2=                                         %  length of the pipe after reducer
k=                                          %  k-value without reducer
%Q0=                                       %  m3/hr
%Q=Q0/60/60                                %  m3/s
%Q0=                                       %  m3/day
%Q=Q0/24/60/60                             %  m3/s
%Q0=                                       %  L/min
%Q=Q0/1000/60                              %  m3/s
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
A1=pi*(D1/2)^2
v1=Q/A1                                        %  velocity  (m/s)
Re1=rho.*v1.*D1./mu                            %  Reynolds number
% Use if/else statement to determine flow regime and calculate f
if Re1<2000
    f1=64./Re1                                 %  Laminar flow
else
    f1=(1./(-1.8.*log10((6.9./Re1)+((absrough./D1)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end

if Re1<2500
    K_reducers=(1.2+(160./Re1)).*((D1./D2).^4-1)
else
    K_reducers=(0.6+0.48.*f1).*(D1./D2).^2.*((D1./D2).^2-1)
end
K_total= K_reducers+k                                                %   total k values

A2=pi*(D2/2)^2
v2=Q/A2                                        %  velocity  (m/s)
Re2=rho.*v2.*D2./mu                            %  Reynolds number
if Re2<2000
    f2=64./Re2                                 %  Laminar flow
else
    f2=(1./(-1.8.*log10((6.9./Re2)+((absrough./D2)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end
% Calculate head loss and pressure drop over pipe
h_fitting=(v1.^2*K_total)/(2.*g)                     %  fitting head loss (m)
DP_fitting=rho*g*h_fitting                 %  fitting pressure drop (Pa)

h_pipe_1=(f1.*L1.*v1.^2)./(2.*D1.*g)               %  pipe head loss (m)
DP_pipe_1=rho*g*h_pipe_1                          %  pipe pressure drop (Pa)

h_pipe_2=(f2.*L2.*v2.^2)./(2.*D2.*g)               %  pipe head loss (m)
DP_pipe_2=rho*g*h_pipe_2                          %  pipe pressure drop (Pa)

h_pipe=h_pipe_1+h_pipe_2
DP_pipe=DP_pipe_1+DP_pipe_2
h_total=h_fitting+h_pipe                      %  total head loss (m)
DP_total=DP_fitting+DP_pipe                   %  total pressure drop (Pa)
