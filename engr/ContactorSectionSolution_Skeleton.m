
%% This is the m-file is a approximate solution for 
%The contactor section of the water treatment design 
%The specifications come from the document Water Disinfection System.

%% This is the section that will finalise the the operational Flow Rates
% Using the total water consumption detetmined in the pipe and distirubtion
% network, process time is now variable to be used to adjust flow rate.


%% Mass of water required in one day, from Pump and Pipe Network seciton 1
% Determined previously.
	
%m3/day	
m3day=  11081.16*0.001;


%% Treatment Flow Rates
% Set pricess treatment time between 3-5 hours
	
%treatment time (hr)	
TRtimeHr=5;
%treatment Time (sec)	18000
TRtimeSec=TRtimeHr/3600;

%flowrate (m3/hr)	2.1838
Qm3hr=m3day/TRtimeHr;
%flowrate (m3/s)	0.000485278
Qm3s=Qm3hr/3600;

Qo = Qm3s;    %Initial flow rate (m^3/s)

%constants, assuming water at 25 Deg C

rho = 998;          %fluid density (kg/m3)
mu = 0.89e-3;       %fluid viscosity (Pa*s)
g = 9.81            % gravitational constant

%% Contactor section 
% Contactor section, L from membrane to reducer 

%Set flow rate from section above
Q = Qo ;   % m3/s

% Use DN100, required for this section
% Use DN100, 
% choose material and pipe schedule  
% ID = OD - 2* wall thickness
% Note PVC or CPVC is not really acceptable here. 
%The ozone will degrade it.  
% CPVC is more temperature resistant, not really against ozone.
ID = (114.3-2*6.02)*0.001
A = pi*ID^2/4;
AR =0.015*0.001 ;    %absolute roughness (m) not needed here, but good to note for section 1.

% Set contactor length from 15 to 25 m

L = 25
%calculate velicty in pipe, v

v = Q/A;  % m/s

% caclulate contact time, convert to in minutes!!!!
% L/v
con_time= (L/v)/60


%% Calculate the login activation credits

%Note:  these are straight out of the problems from problem booklet 5. 
k_p_giardia =  1.038*(1.0741)^25     %k_p for Giardia at a value for T(C); s.L/mg
k_p_virus   =  2.1744*(1.0726)^25       %k_p for viruses aat a value fo T(C); s.L/mg

k_O3 = -(log(1/2)/16)              %k_O3 at 25C, min^-1
Conc_ozone = 0.115     %Onzone Conc in mg/L, DESIGN SPEC

log_inactivation_giardia=(Conc_ozone*k_p_giardia/k_O3)*(1-exp(-k_O3*con_time))
log_inactivation_virus=(Conc_ozone*k_p_virus/k_O3)*(1-exp(-k_O3*con_time))

%% Time the water travels from the reducer to the water tower. 
% Calculate the time for the water to travel from the reducer to the waater
% tower. This must be with a diameter smaller than DN100 
% This time must be greater than 10 minutes and less than 20.
RemainL= 100-L
LtoWT = RemainL + 10+8+1+2.5+0.05


% DN ?????   ID2 = OD - wall thickness
% Same material and schedule as DN100 section
ID2 = (88.9-2*5.49)*0.001; %%DN80
A2 = pi*ID2^2/4;

%calculate velicty in pipe ID2, v2

v2 = Q/A2;  % m/s

% caclulate time to water tower, convert to minues in minutes

timeWT = (LtoWT/v2)/60

%% Display results

disp('For a flow rate of: (m3/s),(m3/hr), (L/s)')
disp([Q, Qm3hr, Q*1000])
disp('')
disp('Contactor Time (min)')
disp(con_time)
disp('')
disp('Contacor Length')
disp(L)
disp('')
disp('log_inactivation_giardia')
disp(log_inactivation_giardia)
disp('')
disp('log_inactivation_virus')
disp(log_inactivation_virus)
disp('')
disp('Time to Water Tower')
disp(timeWT)
disp('')

