
%%%   Reynold number
rho=                                       ;%  density (kg/m^3)
D1=                                         ;%  diameter of pipe (m)
mu=                                        ;%  viscosity of the fluid  (Pa s)
Q=                                         ;%  flow rate  (m^3/s)
A=pi.*(D1./2).^2                            ;%  cross section area  (m^2)
v=Q./A                                      %  velocity  (m/s)
Re1=rho.*v.*D1./mu                            %  Reynolds number

%%%   Darcy friction factor
epsilon=                                   ;%  surface roughness of the pipe  (m)
if Re1<2000
    f1=64./Re1                                 %  Laminar flow
else
    f1=(1./(-1.8.*log10((6.9./Re1)+((epsilon./D1)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
end
g=9.81                                     ;%

%%%  pressure drop across pipe
L=                                               ;%length of the pipe (m)
h_pipe=(f1.*L.*v.^2)./(2.*D1.*g)                          %  head loss (m)
p_pipe=(rho.*f1.*L.*v.^2)./(2.*D1)                        %  pressure drop (Pa)

%%%  pressure drop across fittings
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

D2=                                                 ;%  diameter of pipe (m)

%%%  Reducers
if Re1<2500
    k_reducers=(1.2+(160./Re1)).*((D1./D2).^4-1)
else
    k_reducers=(0.6+0.48.*f1).*(D1./D2).^2.*((D1./D2).^2-1)
end
%%%  Expanders
if Re1<4000
    k_expanders=2*(1-(D1/D2)^4)
else 
    k_expanders=(1+0.8.*f1).*(1-(D1./D2).^2).^2
end
k=                                                 ;%   total k values

h_fittings=(v.^2*k)/(2.*g)                         %   head loss (m)
p_fittings=(rho.*v.^2*k)/2                         %   pressure drop (Pa)


%%% total loss
lv=1/2.*v.^2.*k+(f1.*L.*v.^2)./(2.*D1)                 ;%   loss term
loss_total=1/g.*(1/2.*v.^2.*k+(f1.*L.*v.^2)./(2.*D1))   %   total loss (m)

h=(rho.*v.^2*k)/2+(rho.*f1.*L.*v.^2)./(2.*D1)         % head developed by the pump (m)

Q=                                                    % (L/min)
EP=8.075*10^(-3).*(Q).^2+5.616*10^(-2).*(Q)+17.35              % calculate electrical power (W)
efficiency= 100*(Q).*h/EP
power=(Q.*h)./efficiency
