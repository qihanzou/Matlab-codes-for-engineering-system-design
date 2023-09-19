% Define absrough, rho, g and mu
rho=                                        %  density (kg/m^3)
D=                                          %  diameter of pipe (m) before reducer
%D2=                                        %  diameter of pipe (m) after reducer
mu=                                         %  viscosity of the fluid  (Pa s)   
absrough=                                   %  surface roughness of the pipe  (m)
L=                                          %  length of the pipe (m)
g=9.81
%%
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
%%
A=pi*(D/2)^2
v=Q/A                                        %  velocity  (m/s)
Re=rho.*v.*D./mu                             %  Reynolds number
% Use if/else statement to determine flow regime and calculate f
if Re<2000
    f=64./Re                                 %  Laminar flow
else
    f=(1./(-1.8.*log10((6.9./Re)+((absrough./D)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end
%%
K_total=                                     % total K-values
%%
% Calculate head loss and pressure drop over pipe
h_fittings=(v.^2*K_total)/(2.*g)             %  fitting head loss (m)
DP_fittings=rho*g*h_fittings                 %  fitting pressure drop (Pa)
h_pipe=(f.*L.*v.^2)./(2.*D.*g)               %  pipe head loss (m)
DP_pipe=rho*g*h_pipe                         %  pipe pressure drop (Pa)

h_total=h_fittings+h_pipe                    %  total head loss (m)
DP_total=DP_fittings+DP_pipe                 %  total pressure drop (Pa)
h1=25
h2=50
h_e=h2-h1
h=h_total+h_e

plot(Q,h,'kd-')
title('System curve plot')
ylabel('Head loss (m)')
xlabel('Flow rate (m^3/s)')
hold on
Q_pump1=   %L/s
Q_pump=Q_pump1./1000      %m3/s
h_pump=
plot(Q_pump,h_pump,'rs-')
legend('System curve','Pump curve')
%Q_op=
%h_op=
