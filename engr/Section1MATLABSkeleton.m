
%% This is the m-file is Skeleton for a script for Fluid Section 1. 
%Section 1 of the Design Project- water flow rates and system curve for
%% Flow Rate compoents
% add up water requirements from different parts of brief
%bed ( 271 l/day) X 5 beds 
bed= 271*5
%clinc floor plan ( 2.48 /l/m2 * square meters of clincl floor m2) 
clinic= 2.48*250
%clinic subtotal
clinicsubtotal= bed+clinic
% total number of people, assuming pop growth 
people=  2000*(1+0.012)^10
% how many litres of drinking water per day	
litreperday= (4.1+6)/2*0.8
%total people drinking per day 6760
drinkingperdaypeople= 4.04*people
% daily total l/day	
dailytotal= drinkingperdaypeople+clinicsubtotal
% convert to m3/day
m3day=dailytotal*0.001
%storage capacity of tank = 7 day supply	
storagetank= m3day*7
%% Treatment Flow Rates*
%treatment time (hr)	
TRtimeHr=5
%treatment Time (sec)	
TRtimeSec=TRtimeHr*60*60
%flowrate (m3/hr)	
Qm3hr=m3day/TRtimeHr
%flowrate (m3/s)	
Qm3s=m3day/TRtimeSec
Qo = Qm3s;    %Initial flow rate (m^3/s)
%constants, assuming water at 25 Deg C
rho = 998;          %fluid density (kg/m3)
mu = 0.89e-3;       %fluid viscosity (Pa*s)
g = 9.81            % gravitational constant
%% DN100 section (tank outlet  to reducer, minus membrane)
%This accounts for frictional losses (not height changes)
%for the section of pipes and valves from the water storage tank to the
%reducer
%NOTE: The membrane is calculated in a separate secion.

%Set flow rate from section above
Q = Qo ;   % m3/s

% Use DN100, recomended for pipe upto Membrane, required for section
% just after membrane, before reducer.
% Use DN100, 
% Choose pipe schedule
% Choose pipe material, epsilon = ?? mm
% DN100, get OD and wall thickness from pipe schedule
% OD - 2*wall thickness = ID

ID = (114.3-2*6.02)*0.001
A = pi*ID^2/4;
AR = 0.015*0.001     %absolute roughness (m), i.e. epsilon in m staunless steel

%v, Re and f

v = Q/A;  % v for v large, this v is not either point in the EBE

Re = rho*v*ID/mu;

if Re < 2000
    f = 64/Re;
else
 f = (1/(-1.8*log10(6.9/Re+((AR/ID)/3.7)^1.11)))^2; % Haaland correlation turbulent
end

%fitting losses
%K-value for reducer calculation
% Need D2 
% As a start, use the same material as above
% Use either DN 65 or DN80 for now. Change later if you want to
% Remember to get OD and wall thickness to calc D2
D2 =  (88.9-2*5.49)*0.001   %DN80

% Calc K value for reducer 
if Re < 2500
    Kred = (1.2+160/Re)*((ID/D2)^4-1)
else
    Kred = (0.6+0.48*f)*(ID/D2)^2*((ID/D2)^2-1)
end    

% Add up fitting losses
% ent???
% el????  
% Ball Valve, open  how many,    note: use value from workshop!!
% Kred
Ktot =  Kred+0.75+0.75+5*9
h_f_100 = Ktot*v^2/(2*9.81)

%head loss due to pipe flow
% L from membrane to reducer
Lcontact = 25
Ltot =  2.5+5+16+8+Lcontact  %Lcontact
h_pipe_100 = f*Ltot*v^2/(2*ID*9.81)


%% DN80 or DN65 mm section ( reducer outlet to water tower)
% after water treatment you can refine and change D2 as needed
A2 = pi*D2^2/4;
v2 = Q/A2;  % this is the v in the EBE at exit, v2

Re2 =  rho*v2*ID/mu;   %Calc Re2 using A2 and v2 and D2


if Re2 < 2000
    f80 = 64/Re2;
else
    f80 = (1/(-1.8*log10(6.9/Re2+((AR/D2)/3.7)^1.11)))^2; % Haaland correlation turbulent
end

   
% Add up fitting losses
% ex
% elb
Ktot = 1+2*0.75
h_f_80 = Ktot*v2^2/(2*9.81)

%head loss due to pipe flow
% portion of 100 m not set by Lcontact  100 - Lcontact
% vertical ?????
% horizontal ?????? 
Ltot80= (100-Lcontact)+ 10 + 8+1+2.5+0.05;
h_pipe_80 =  f80*Ltot80*v2^2/(2*D2*9.81)    % similar to h_pipe_100, but different variables

%% velocity heads
v1 = 0   %assume velocity at surface of tank ????
v2 =  v2  %velocity at end of pipe ??????
h_vel = (v2^2-v1^2)/(2*9.81); %alpha = 1, turbulent flow
%% elevation head
% assume lowest point, h = 0 is the pipe into the pump
h1 = 13-1 %water storage tank height 
h2 = 10+8+1+2.5 %Exit into water tower 
h_z = h2-h1
%% Membrane Pressure Drop
% Calcualtes the pressure drop using the flow rate Q for a flow through a
% membrane or sereis of membranes based on the solution to the treatment
% requirements.  
%Until the water treatment is finalised 
%use the following membrane properties
% Membrane type:  Gad-Cell 4X28
% Fiber ID:  0.7
% Number of Fibers: 2389
NumFiber=2389;
% Length of Membrane:0.789 m
IDfib=0.7*10^(-3);        % in m
Lfib =0.789        % in m
%Calc flow per fiber
Qfib=Q/NumFiber; 
%calculate pipe Cross sectional area of a single fibre
Afib = pi*IDfib^2/4; 
%calculate flow velocity
vfib = Qfib/Afib; 
%calculate Reynold's number
Refib =rho*vfib*IDfib/mu;       %calculate Reynold's number using IDfib and vfib
%Calculate f note, for membranes, almost alway laminar
%Determine laminar or turbulent flow and calculate f accordingly
    ffib = 64/Refib;  % use laminar correlation, use Refib!!!
% frictional loss
h_mem_X1=ffib*Lfib*(vfib^2)/(2*9.81*IDfib)
h_mem_total=h_mem_X1*2
%% determine h (note, -h_z because change in elevation is going down, h1 = 0)
h_fittings = h_f_100+h_f_80
h_pipe = h_pipe_100+h_pipe_80
h = h_z + h_vel + h_fittings + h_pipe+h_mem_total %head at pipe outlet
DP=h*rho*9.81
%% Calc Pump Requirements
% Calc shaft work and assume an efficeincy and calc. required power
% Once impeller design finalised with a set value, use eff ~ 20 %.
% You should use the maxium eff you measured on your choosen impeller once
% you finalise your design.  It's probably of the order of 20%-ish
Ws = h*9.81
Pumpeff= 0.229932;
Power = (Q.*DP)./Pumpeff
%%
hp=(22-2.5)+(v2)^2/(2*9.8)+h_fittings + h_pipe+h_mem_total
%% Display results

disp('For a flow rate of: (m3/s),(m3/hr), (L/s)')
disp([Q, Qm3hr, Q*1000])
disp('')
disp('Total system head: (m)')
disp(h)
disp('')
disp('Difference in Pressure: (Pa)')
disp(DP)
disp('')
disp('Shaft work required: (W)')
disp(Ws)
disp('')
disp('Power Required: (W)')
disp(Power)
disp('')





