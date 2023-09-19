%% Calculate ozone decay constant and rate constants
V0=       %L
V=V0/1000 %m3
c=
T=
t_half_life=                    %      half life for gas    mins   
k_O3=-log(1/2)./t_half_life
kp_Giardia = 1.038.*(1.0741).^T;
kp_viruses=2.1744.*(1.0726).^T;

%% Calculate contactor section
D1=
treat_time=     %s
Q=V/treat_time; %m3/s
A=pi*(D1/2)^2;
v=Q/A;  %m/s 
L=
con_time=L/v/60
log_Giardia=c./(k_O3./(kp_Giardia.*(1-exp(-k_O3.*con_time))))    
log_viruses=c./(k_O3./(kp_viruses.*(1-exp(-k_O3.*con_time))))

%% Determine water travel time after exiting contactor
L2=
D2=
A2=pi*(D2/2)^2;
v2=Q/A2
time_travel=L2/v2/60

% Find a combination of membranes to use
% Vector list of membrane areas (m2)
A_mod = [1.1 2.17 4.15 8.43 12.41 30.31];
Q1=Q*3600
Area_req= 4.1703.*Q1
% Vector list of mnumber of membrane modules
N_mod = [0 0 0 0 0 0];

% Total combination of areas and area difference
Area_comboV=sum(A_mod.*N_mod)
A_diff=Area_comboV-Area_req


