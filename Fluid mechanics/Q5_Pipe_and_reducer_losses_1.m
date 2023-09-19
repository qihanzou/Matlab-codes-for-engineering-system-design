% Define absrough, rho, g and mu
rho=                                        %  density (kg/m^3)
D1=                                         %  diameter of pipe (m) before reducer
D2=                                         %  diameter of pipe (m) after reducer
mu=                                         %  viscosity of the fluid  (Pa s)   
absrough=                                   %  surface roughness of the pipe  (m)
L=                                          %  length of the pipe (m)

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
A=pi*(D1/2)^2
v=Q/A                                        %  velocity  (m/s)
Re=rho.*v.*D1./mu                            %  Reynolds number
% Use if/else statement to determine flow regime and calculate f
if Re<2000
    f=64./Re                                 %  Laminar flow
else
    f=(1./(-1.8.*log10((6.9./Re)+((absrough./D1)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end

if Re<2500
    K_reducers=(1.2+(160./Re)).*((D1./D2).^4-1)
else
    K_reducers=(0.6+0.48.*f).*(D1./D2).^2.*((D1./D2).^2-1)
end
K_total= K_reducers                                                %   total k values
% Calculate head loss and pressure drop over pipe
h_fitting=(v.^2*K_total)/(2.*g)                     %  fitting head loss (m)
DP_fitting=rho*g*h_fitting                 %  fitting pressure drop (Pa)
h_pipe=(f.*L.*v.^2)./(2.*D1.*g)               %  pipe head loss (m)
DP_pipe=rho*g*h_pipe                          %  pipe pressure drop (Pa)

h_total=h_fitting+h_pipe                      %  total head loss (m)
DP_total=DP_fitting+DP_pipe                   %  total pressure drop (Pa)


