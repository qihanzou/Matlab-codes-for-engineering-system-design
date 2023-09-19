Am=   8.3      ; %Total area of the chosen membranes
A_particle= pi*(46.340*10^-6/2)^2      ; %m  Average area of the particles from microscopy/camera image 
t_op= 5 ; % water treatement time in hr
Q_water_Ls=0.61548 ;%water flow in L/s
Q_water_mLhr=Q_water_Ls*(10^3)*3600  ; %water flow in mL/hr

T_part=[8 8.5 9 9.5 10 10.5 11 11.5 12]; %Time in Operation, Tpart (months)
C_part=[0.10 0.23 0.51 1.15 2.59 5.84 13.16 29.69 66.96]; %Particle Concentration, Cpart (particles/ml)
A_failure= 0.74*(0.3*Am); % m2 Membrane area (covered by particles) for failure
n_foul=A_failure./A_particle ; %Number of particles required to foul membrane
n_1day=t_op.*Q_water_mLhr.*C_part ;% particles Number of particles that contact with membrane in treatment time, in one day of operation
d=n_foul./n_1day ; %Days until membrane is fouled
t_foul=d.*t_op %Hours of continuous operation until membrane is fouled
n_filters1=5*12./T_part ; %%Number of filter changes in 5 years
n_filters=floor(n_filters1); %Round down to an integer value
t_filters=t_op.*n_filters %Total number of hours of contaminated run time

T = table(T_part,C_part,n_filters,t_filters,t_foul)
T.Properties.VariableNames = {'T_part (months)','C_part (particles/ml)','No of filter changes in 5 years','t_filters (hours)','t_foul (hours)'}

fprintf(1, ' #ID |   T_part    |   C_part       |    No of filter    |   t_filters  |  t_foul  |\n');
fprintf(1, '     |  (months)   | (particles/ml) | changes in 5 years |    (hours)   |  (hours) |\n');
fprintf(1, '-----------------------------------------------------------------------------------|\n');
for i = 1:length(T_part)
fprintf(1, ' %2d  | %11.2f | %17.4f | %17.4f |\n',i,T_part(i), 
C_part(i),n_filters(i),t_filters(i),t_foul(i));
end
%}
