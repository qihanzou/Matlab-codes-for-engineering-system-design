D=
c=
T=
t_half_life=
k_O3=-log(1/2)./t_half_life
kp_Giardia = 1.038.*(1.0741).^T;
kp_viruses=2.1744.*(1.0726).^T;

log_10_deactivation_G=
log_10_deactivation_v=
con_time_Giardia = -1/k_O3*log(1-k_O3*log_10_deactivation_G/(kp_Giardia*c))
con_time_viruses = -1/k_O3*log(1-k_O3*log_10_deactivation_v/(kp_viruses*c))

L=
if con_time_Giardia<con_time_viruses
   v1=L/con_time_viruses
else
   v1=L/con_time_Giardia
end
v=v1/60
A=pi*(D/2)^2;
Q =A*v;

pop = 1200*(1+0.02)^20;
vol_m3_per_day = pop*7/1000;
V=vol_m3_per_day/24
QQ=Q*3600
treatment_time = vol_m3_per_day/QQ;

Q1=Q*3600
Area_req = 6.5556*Q1

A_mod = [1.1 2.17 4.15 8.43 12.41 30.31];
N_mod = [2 0 1 2 0 0];

Area_comboV = sum(A_mod.*N_mod);
A_diff = Area_comboV-Area_req