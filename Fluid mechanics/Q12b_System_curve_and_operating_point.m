% Define absrough, rho, g and mu
rho=                                        %  density (kg/m^3)
D1=                                         %  diameter of pipe (m) before reducer
D2=                                         %  diameter of pipe (m) after reducer
mu=                                         %  viscosity of the fluid  (Pa s)   
absrough=                                   %  surface roughness of the pipe  (m)
L1=                                         %  length of the pipe (m)
L2=
%% flow rate
%Q0=                                        %  m3/hr
%Q=Q0/60/60                                 %  m3/s
%Q0=                                        %  m3/day
%Q=Q0/24/60/60                              %  m3/s
%Q0=                                        %  L/s
%Q=Q0/1000                                  %  m3/s
%Q0=                                        %  L/min
%Q=Q0/1000/60                               %  m3/s
%Q0=                                        %  L/hr
%Q=Q0/1000/60/60                            %  m3/s
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
%%
% Calculate Q, A, v and Re
A1=pi*(D1/2)^2                                 %  area before reducer
v_500=Q/A1                                     %  velocity before reducer (m/s)
A2=pi*(D2/2)^2                                 %  area after reducer
v_300=Q/A2                                     %  velocity after reducer (m/s)
Re_500=rho.*v_500.*D1./mu                      %  Reynolds number before reducer
Re_300=rho.*v_300.*D2./mu                      %  Reynolds number before reducer

% Use if/else statement to determine flow regime and calculate f
if Re_500<2000
    f_500=64./Re_500                           %  Laminar flow
else
    f_500=(1./(-1.8.*log10((6.9./Re_500)+((absrough./D1)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end

if Re_300<2000
    f_300=64./Re2_300                          %  Laminar flow
else
    f_300=(1./(-1.8.*log10((6.9./Re_300)+((absrough./D2)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end

if Re_500<2500
    K_red=(1.2+(160./Re_500)).*((D1./D2).^4-1)
else
    K_red=(0.6+0.48.*f_500).*(D1./D2).^2.*((D1./D2).^2-1)
end
%%
Ktot1=                                       % K-values before reducer
Ktot2=                                       % K-values after reducer
%%
% Calculate head loss and pressure drop over pipe
h_fittings1=(v_500.^2.*Ktot1)./(2.*g)             %  fitting head loss before reducer(m)
DP_fittings1=rho.*g.*h_fittings1               %  fitting pressure drop before reducer(Pa)
h_fittings2=(v_300.^2.*Ktot2)./(2.*g)             %  fitting head loss after reducer(m)
DP_fittings2=rho.*g.*h_fittings2               %  fitting pressure drop after reducer(Pa)

h_fittings=h_fittings1+h_fittings2           %  total fitting head loss (m)
DP_fittings=DP_fittings1+DP_fittings2        %  total fitting pressure drop (Pa)

h_pipe1=(f_500.*L1.*v_500.^2)./(2.*D1.*g)          %  pipe head loss before reducer(m)
DP_pipe1=rho.*g.*h_pipe1                       %  pipe pressure drop before reducer(Pa)
h_pipe2=(f_300.*L2.*v_300.^2)./(2.*D2.*g)          %  pipe head loss after reducer(m)
DP_pipe2=rho.*g.*h_pipe2                       %  pipe pressure drop after reducer(Pa)

h_pipe=h_pipe1+h_pipe2                       %  total pipe head loss (m)
DP_pipe=DP_pipe1+DP_pipe2                    %  total pipe pressure drop (Pa)

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
Q_pump=Q_pump1./1000      %m3/s
h_pump=[27.9 27.8 27.6 27.4 27.1 26.8 26.4 26 25.5]
plot(Q_pump,h_pump,'rs-')
legend('System curve','Pump curve')
Q_op=0.2
h_op=26.7