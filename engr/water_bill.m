
function [step1, step2, step3, total_cost] = water_bill(water_usage)
% This function calculates the cost of water usage 
%Input:  water usage amount in kL
% Outputs: step1 – breakdown cost of the first 440 kL
if (water_usage<=440);
    step1=water_usage*2.6;
else
    step1=440*2.6;
end
%          step2 – breakdown cost of the next 440 kL
if (water_usage<=880)& (water_usage>=441);
    step2=(water_usage-440)*3;
else if (water_usage>=881);
    step2=440*3;
    else 
        step2=0
end 
    %step3 – breakdown cost of usage above 880 kL
if (water_usage>=881);
step3=(water_usage-880)*4.2;
else
    step3=0;
end
%          total_cost – cost of total water usage 
total_cost=step1+step2+step3;


end