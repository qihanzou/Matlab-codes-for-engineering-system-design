% Define absrough, rho, g and mu
rho=                                     %  density (kg/m^3)
D1=                                      %  diameter of pipe (m)
mu=                                      %  viscosity of the fluid  (Pa s)   
absrough=                                %  surface roughness of the pipe  (m)
L=                                       %  length of the pipe (m)
Q0=                                      %  L/min
Q=Q0/1000/60                             %  m3/s
g=9.81                                   %

% Calculate Q, A, v and Re
A=pi*(D1/2)^2
Q0=25 %L/min
Q=Q0/1000/60 %m3/s
v=Q/A                                        %  velocity  (m/s)

Re=rho.*v.*D1./mu                            %  Reynolds number

% Use if/else statement to determine flow regime and calculate f
%%%   Darcy friction factor
if Re<2000
    f=64./Re1                                 %  Laminar flow
else
    f=(1./(-1.8.*log10((6.9./Re)+((absrough./D1)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end


% Calculate head loss and pressure drop over pipe
%%%  pressure drop across pipe
h_pipe=(f.*L.*v.^2)./(2.*D1.*g)                          %  head loss (m)
DP_pipe=(rho.*f.*L.*v.^2)./(2.*D1)                        %  pressure drop (Pa)






