rho = 998;          %fluid density (kg/m3)
mu = 0.89e-3;       %fluid viscosity (Pa*s)
g = 9.81            % gravitational constant
%% DN100 section (tank outlet  to reducer, minus membrane)
%Set flow rate from section above
Qo = [0:0.01*0.61548:2*0.61548]; %L/s
Q = Qo./1000 ;   % m3/s
% just after membrane, before reducer.
% Use DN100, 
ID = (114.3-2*6.02)*0.001
A = pi*ID^2/4;
AR = 0.015*0.001     %absolute roughness (m), i.e. epsilon in m
%v, Re and f
v = Q./A;  % v for v large, this v is not either point in the EBE
Re = rho.*v.*ID./mu;
if Re < 2000
    f = 64./Re;
else
 f = (1./(-1.8.*log10(6.9./Re+((AR./ID)./3.7).^1.11))).^2; % Haaland correlation turbulent
end
%fitting losses
%K-value for reducer calculation
D2 =  (88.9-2*5.49)*0.001   %DN80
% Calc K value for reducer 
if Re < 2500
    Kred = (1.2+160./Re).*((ID./D2).^4-1)
else
    Kred = (0.6+0.48.*f).*(ID./D2).^2*((ID./D2).^2-1)
end    
% Add up fitting losses
% Kred
Ktot =  Kred+0.75+0.75+5*9
h_f_100 = Ktot.*v.^2./(2.*9.81)

%head loss due to pipe flow
% L from membrane to reducer
Lcontact = 25
Ltot =  2.5+5+16+8+Lcontact  %Lcontact
h_pipe_100 = f.*Ltot./ID.*v.^2./(2.*9.81)
%% DN80 or DN65 mm section ( reducer outlet to water tower)
% after water treatment you can refine and change D2 as needed
A2 = pi*D2^2/4;
v2 = Q./A2;  % this is the v in the EBE at exit, v2

Re2 =  rho.*v2.*ID./mu;   %Calc Re2 using A2 and v2 and D2
if Re2 < 2000
    f80 = 64./Re2;
else
    f80 = (1./(-1.8.*log10(6.9./Re2+((AR./D2)./3.7).^1.11))).^2; % Haaland correlation turbulent
end 
% Add up fitting losses
% ex
% elb
Ktot = 1+2*0.75
h_f_80 = Ktot.*v2.^2./(2.*9.81)

%head loss due to pipe flow
% portion of 100 m not set by Lcontact  100 - Lcontact
% vertical ?????
% horizontal ?????? 
Ltot80= (100 - 25)+ 10 + 8+1+2.5+0.05;
h_pipe_80 =  f80.*Ltot80./D2.*v2.^2./(2.*9.81)    % similar to h_pipe_100, but different variables

%% velocity heads
v1 = 0   %assume velocity at surface of tank ????
v2 =  v2  %velocity at end of pipe ??????
h_vel = (v2.^2-v1.^2)./(2.*9.81); %alpha = 1, turbulent flow
%% elevation head
% assume lowest point, h = 0 is the pipe into the pump
% h1 = water storage tank height 
% h2 = Exit into water tower 
h_z = (2.5+1+8+10)-(13-1)
%% Membrane Pressure Drop
NumFiber=2389;
IDfib=0.7*10^(-3);        % in m
Lfib =0.789        % in m
Qfib=Q./NumFiber; 
%calculate pipe Cross sectional area of a single fibre
Afib = pi.*IDfib.^2./4; 
%calculate flow velocity
vfib = Qfib./Afib; 
%calculate Reynold's number
Refib =rho.*vfib.*IDfib./mu;       %calculate Reynold's number using IDfib and vfib
%Calculate f note, for membranes, almost alway laminar
%Determine laminar or turbulent flow and calculate f accordingly
    ffib = 64./Refib;  % use laminar correlation, use Refib!!!
% frictional loss
h_mem_X1=ffib.*Lfib.*(vfib.^2)./(2.*9.81.*IDfib)
h_mem_total=h_mem_X1.*2
%% determine h (note, -h_z because change in elevation is going down, h1 = 0)
h_fittings = h_f_100+h_f_80
h_pipe = h_pipe_100+h_pipe_80
h = h_z + h_vel + h_fittings + h_pipe+h_mem_total %head at pipe outlet
DP=h.*rho.*9.81
h_loss=h_fittings + h_pipe+h_mem_total
hp=(22-2.5)+(v2).^2./(2*9.8)+h_fittings + h_pipe+h_mem_total
%% Curve 
PumpFlow=Qo    %L/s
plot(PumpFlow,hp,"b-")
xlabel('Flow rate (L/s)')
ylabel('System head (m)')
title('System curve')
%(
Q1=[0.2692    0.2590    0.2340    0.2030    0.1712    0.1395    0.0978    0.0670    0.0412    0.0155]
h1=[1.5154    1.5373    1.6245    1.7552    1.8752    1.9951    2.1805    2.2895    2.3876    2.4312]
plot(Q1,h1,"rs-")
hold on
plot(PumpFlow,hp,"b-")
xline(0.61548)
%Current Impeller Diameter in mm
D1= 38
% New impeller diam in mm
D2 = 140.5
%Impeller Ratio, d2/d1
dratio= D2/D1
%New Pump Curve
pumpflownew = dratio.*Q1
performnew =(dratio).^2.*h1
plot(pumpflownew,performnew,"ko-")
xlabel('Flow rate (L/s)')
ylabel('System head (m)')
title('System & Pump curve and Scaling Up Impeller')
%Decide legend location after looking at plot
legend('Pump curve','System curve','The operation flow rate','New Pump Curve','location','northeast')
hold off
%)










