T=[]  % temperature in C
%%
kp_Crypt  = 0.0397.*(1.09757).^T     %k_p for Cryptosporidium as a function of T(C); s.L/mg
kp_Giardia = 1.038.*(1.0741).^T      %k_p for Giardia as a function of T(C); s.L/mg
kp_viruses   = 2.1744.*(1.0726).^T   %k_p for Viruses as a function of T(C); s.L/mg
%%
log_Crypt=kp_Crypt.*0.2.*15
c_Giardia=4./(kp_Giardia.*12)
t=3./(kp_viruses.*0.5)
Q=4/3600
D=100*10^-3
A=pi*(D/2)^2
v=Q./A*60
L_viruses=v.*t