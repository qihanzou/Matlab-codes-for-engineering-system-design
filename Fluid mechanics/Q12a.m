% Define absrough, rho, g and mu
rho=998                                        %  density (kg/m^3)
D=500*10^-3                                          %  diameter of pipe (m) before reducer
%D2=                                        %  diameter of pipe (m) after reducer
mu=1*10^-3                                         %  viscosity of the fluid  (Pa s)   
absrough=3*10^-6                                   %  surface roughness of the pipe  (m)
L= 8+15+20+45+8                                         %  length of the pipe (m)

Q0=[50:10:250]                              %  L/s
Q=Q0./1000                                   %  m3/s
g=9.81

%%
% Calculate Q, A, v and Re
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
K_total=3*0.75+1+0.75                                     % total K-values
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
Q_pump1=[50:25:250]   %L/s
Q_pump=Q_pump1./1000
h_pump=[30 29.1 28 26.6 25 23.1 21 18.6 16]
plot(Q_pump,h_pump,'rs-')
legend('System curve','Pump curve')
Q_op=0.14
h_op=25