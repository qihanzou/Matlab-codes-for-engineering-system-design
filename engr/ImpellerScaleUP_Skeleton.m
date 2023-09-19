%This is the m-file for ESD1, Salce Up for Impeller in Design Section 1
%Scaling up an impeller to meet a flow specification

%system curve data flow rate (L/s), Head loss (m)
flowrate = [];
headloss = [];




%pump curve data pump flow rate (L/s), performance (m), 
 
%Student put in their best pump curve
pumpflow = [];
perform = [];

%Operating Fluid point in  L/s
opflowpoint=0
opflow=[opflowpoint opflowpoint];
opheight=[0 max(headloss)];

%Current Impeller Diameter in mm from student design
D1= 

% New impeller diam in mm . will change iteratively
D2 = 

%Impeller Ratio, d2/d1
dratio=

%New Pump Curve . scale old pump data with ratio, remember to use .*
%operator,   scale according to Affinity laws 
%(one is dratio, one is dratio^2, which one?
pumpflownew = 
performnew = 

%plot curves
plot(flowrate,headloss,'ro-')
grid on
hold on
plot(pumpflow,perform,'k^-')
plot(pumpflownew,performnew,'bs-')
plot(opflow,opheight,'g-')
xlabel('Flow rate (L/s)')
ylabel('System head (m)')
title('Scaling Up Impeller-Section 1 Design Project')
%Decide legend location after looking at plot
legend('System curve','Pump curve','New Pump Curve','Op Flow','location','northeast')
hold off


