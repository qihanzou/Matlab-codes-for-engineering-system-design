Q_50_L=[0:20:140]                 %L/s
Q_50=Q_50_L./1000    %m3/s
h_50=[10 9.8 9.5 9 8.3 7.5 6.5 5.4]
Q_sys_L=[0:30:240]
Q_sys=Q_sys_L./1000
h_sys=[37 37.1 37.3 37.6 38 38.4 39 39.6 40.4]

D_50=50
D_95=95
D_100=100
D_105=105

Q_95=(D_95./D_50).*Q_50                % know Q1,D1,D2, find Q2
h_95=(D_95./D_50).^2.*h_50             % know h1,D1,D2, find h2

Q_100=(D_100./D_50).*Q_50              % know Q1,D1,D2, find Q2
h_100=(D_100./D_50).^2.*h_50           % know h1,D1,D2, find h2

Q_105=(D_105./D_50).*Q_50              % know Q1,D1,D2, find Q2
h_105=(D_105./D_50).^2.*h_50           % know h1,D1,D2, find h2
 
plot(Q_sys,h_sys,'b-')
title('Impeller scale up curve plot')
ylabel('Head loss (m)')
xlabel('Flow rate (m^3/s)')
hold on
plot(Q_50,h_50,'k-')
plot(Q_95,h_95,'r-')
plot(Q_100,h_100,'g-')
plot(Q_105,h_105,'y-')
hold off
legend('sys','50','95','100','105')
final_impeller=100