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
D=
%% ozone decay constant:
t_half_life=                            %      half life for gas    mins   
k_O3=-log(1/2)./t_half_life
%% log_viruses
templist=
c_O3_0_virus=
t1=
k_p_virus=2.1744*(1.0726).^templist   %k_p for Viruses as a function of T(C); s.L/mg
log_viruses=c_O3_0_virus/(k_O3 / (k_p_virus* (1-exp(-k_O3*t1))))     
%% G
log_10_deactivation=
t2=
k_p_giardia = 1.038*(1.0741).^templist    %k_p for Giardia as a function of T(C); s.L/mg
c_Giardia =  log_10_deactivation * k_O3 / (k_p_giardia* (1-exp(-k_O3*t2)))
%% C
k_p_crypto = 0.0397*(1.09757).^templist   %k_p for as a function of T(C); s.L/mg
c_O3_crypto  = 
log_10_deactivation2=
t_Crypt=-1/k_O3*log(1-k_O3*log_10_deactivation2/(k_p_crypto*c_O3_crypto))
Q=         %% m3/min
A=pi*(D/2)^2
v=Q/A      %% m/min   must be m/min
L_Crypt=v*t_Crypt

