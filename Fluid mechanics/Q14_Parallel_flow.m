%% Define absrough, rho, g and mu
rho=                                        %  density (kg/m^3)
D1=                                         %  diameter of pipe (m) before reducer
%D2=                                        %  diameter of pipe (m) after reducer
mu=                                         %  viscosity of the fluid  (Pa s)   
absrough=                                   %  surface roughness of the pipe  (m)
L_non=                                      %  length of the pipe in non parallel section (m)
L_par=                                      %  length of the pipe in parallel section (m)
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
A=pi*(D1/2)^2
v_non=Q/A                                                                    %  velocity in non parallel section (m/s)
Re_non=rho.*v_non.*D1./mu                                                    %  Reynolds number in non parallel section

%% f, fittings and pipe loss in non parallel section
if Re_non<2000
    f_non=64./Re_non                                                         %  Laminar flow 
else
    f_non=(1./(-1.8.*log10((6.9./Re_non)+((absrough./D1)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end
K_non=1+0.75+1+1
h_fittings_non=(v_non.^2*K_non)/(2.*g)                                       %  fitting head loss (m)
DP_fittings_non=rho*g*h_fittings_non                                         %  fitting pressure drop (Pa)

h_pipe_non=(f_non.*L_non.*v_non.^2)./(2.*D1.*g)                              %  pipe head loss (m)
DP_pipe_non=rho*g*h_pipe_non                                                 %  pipe pressure drop (Pa)

%% f, fittings and pipe loss in parallel section
number_of_road=                                                              %  the number of parallel roads
Q_par=Q/number_of_road                                                       %  velocity  (m/s)
A2=pi*(D1/2)^2
v_par=Q_par/A2                                                               %  velocity  (m/s)
Re_par=rho.*v_par.*D1./mu                                                    %  Reynolds number
if Re_par<2000
    f_par=64./Re_par                                                         %  Laminar flow
else
    f_par=(1./(-1.8.*log10((6.9./Re_par)+((absrough./D1)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end

K_par=2*0.35+2*0.75
h_fittings_par=(v_par.^2*K_par)/(2.*g)                                       %  fitting head loss (m)
DP_fittings_par=rho*g*h_fittings_par                                         %  fitting pressure drop (Pa)

h_pipe_par=(f_par.*L_par.*v_par.^2)./(2.*D1.*g)                              %  pipe head loss (m)
DP_pipe_par=rho*g*h_pipe_par                                                 %  pipe pressure drop (Pa)

%% total loss in m and Pa
h_total=h_fittings_non+h_pipe_non+h_pipe_non+h_pipe_par                      % m
DP_total=DP_pipe_par+DP_pipe_non+DP_fittings_par+DP_fittings_non             %Pa









