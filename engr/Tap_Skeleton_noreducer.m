%This is the m-file for ESD1, Tap 1- Section 2

% calculation based on   m3, water tower a cube based
% on this volume.
Q=11081.16   %L/day
C = (11081.16*0.001)^(1/3)      % value of total water use in a day in m3
%{
I will leave everything in head (m) throughout the calculations and then
convert at the end to pressure. 
%}
% design specification 9 L/min
Qo = 9;    %Initial flow rate (L/min)


%constants
AR = 0.0015*0.001   ; 	  %absolute roughness (m) . based on pipe selection
rho = 998;          %fluid density (kg/m3)
mu = 0.89e-3;        %fluid viscosity (Pa*s)


%% pipe section (only section)
% Likely choices: DN15, DN20, DN25, DN32 or DN40
% ID = OD - 2 * wall thickness
%v, Re and f

Q = Qo*0.001/60;       % convert to m3/s
ID = (33.4-2*3.38)*0.001            %%DN25
A = pi*ID^2/4;
v = Q/A;

Re = rho*v*ID/mu;


if Re < 2000
    f = 64/Re;
else
    f =  (1/(-1.8*log10(6.9/Re+((AR/ID)/3.7)^1.11)))^2;
end

%head loss due to fittings
%entrance,exit, however many elbows or branches
Ktot = 1+0.75+5*0.75+1;
h_fittings = Ktot*v^2/(2*9.81)

%head loss due to pipe flow
%Cube of water tower =      m3
% Edge of water tower = C = sqrt(C) = 2.2294
% 
Ltot = 5+1.5+6.25+4+8.1+1.6;
h_pipe =  f*Ltot/ID*v^2/(2*9.81) %accumulate h

%% velocity heads
v1 = 0; %assume large tank, surface velocity is zero
v2 = v; %velocity at end of pipe is velocity in pipe
h_vel = (v1^2 - v2^2)/(2*9.81); %alpha = 1, turbulent flow

%% static pressure head
P1 = 101325;
h_static =P1/(rho*9.81) ;

%% elevation head
% Edge of water tower = C = (water)^(1/3) = 2.2294
% H1 = C+5+4+1.5, Ht = 2 m    h_z = H1-Ht

h_z = (C+5+3.5+2)-(2)

%% determine h
h_P2 =h_z-h_vel-(h_pipe+h_fittings)+h_static ; %head at pipe outlet


%% Convert h to DP and display results
P2 = rho*9.81*h_P2 %pressure at pipe outlet
Pabs=P2+P1

disp('For a flow rate of: (L/s)')
disp(Qo)
disp('')
disp('The pressure at the end of the pipe is: (Pa)')
disp(P2)
disp('')
disp('The pressure at the end of the pipe is: ( kPa)')
disp(P2/1000)
disp('')