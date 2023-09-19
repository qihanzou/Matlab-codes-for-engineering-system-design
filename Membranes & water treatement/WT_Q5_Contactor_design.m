D=
V0=                    %L
V=V0/1000;             %m3
c=                     %mg/L
T=
t_half_life=      ;    %      half life for gas    mins  
%%
k_O3=-log(1/2)./t_half_life;
kp_Giardia = 1.038.*(1.0741).^T;
kp_viruses=2.1744.*(1.0726).^T;
treat_time_1=           ; % s
L=                        % m
Q=V/treat_time_1;         % m3/s
A=pi*(D/2)^2;
v=Q/A;                    % m/s  
con_time=L/v/60;
log_Giardia=c./(k_O3./(kp_Giardia.*(1-exp(-k_O3.*con_time))))    
log_viruses=c./(k_O3./(kp_viruses.*(1-exp(-k_O3.*con_time))))

treat_time_2=            ; % s
Q_2=V/treat_time_2;
A_2=pi*(D/2)^2;
v_2=Q_2/A_2;
con_time_2=L/v_2/60;
log_Giardia_2=c./(k_O3./(kp_Giardia.*(1-exp(-k_O3.*con_time_2))))

Q_3=V/treat_time_1;
A_3=pi*(D/2)^2;
v_3=Q_3/A_3;
con_length_3=
con_time_3=con_length_3/v_3/60;
log_viruses_3=c./(k_O3./(kp_viruses.*(1-exp(-k_O3.*con_time_3))))

