% calculate beta's for impeller

% inital data based on max flowrate and pressure head
%YOU CAN CHANGE THIS
qo = 15; %L/min
q= qo/1000/60;
hp= 1.5;  % m

% pump rpm, constant
rpm = 2000;
omega = rpm/60*2*pi()

% impeller inner and outer radius
%YOU SHOUDL CHANGE R2, max = 19 mm
r1o = 9.4;
r2o = 19;  
r1= r1o/1000;
r2 = r2o/1000;

%impeller thickness/width 10 mm
b1 = 0.01;
b2=b1;

%blade angle at r1, convert back to degrees from radians
beta1= atan(q/(2*pi()*b1*omega*r1^2))*180/pi();

%blade angle at r2, convert back to degrees from radians
% calc. tangential velocity at edge of impeller
V2t = 9.81*hp/(omega*r2);
% Calc. normal velocity at edge of impeller
V2n = q/(2*pi()*r2*b2);

beta2= atan(V2n/(omega*r2-V2t))*180/pi();
r2l=[14:0.001:25]/1000;

V2tlist = 9.81.*hp./(omega.*r2l);
V2nlist = q./(2.*pi().*r2l.*b2);
betafun=atan(V2nlist./(omega.*r2l-V2tlist)).*180./pi();

%%%OUTPUT

plot(r2l*1000,betafun,"m-")
xlabel("Radius (mm)","FontSize",18)
ylabel("beta2, angle of blade at edge (o)","FontSize",18)
title("Angle of Blade at Edge of Imepller ","FontSize",18)
hold on
clc
disp('radius 1 and 2')
disp([r1,r2])
disp('')
disp('beta 1 and 2')
disp([beta1, beta2])
disp('')

