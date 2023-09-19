function time = calculate_inv(investment,goal,rate)
time=0; % start with time 0
while investment < goal % if investment less than goal, continue, if not, will not start
    investment=investment*(1+rate/100) % new investement to old X rate
    time=time+1 
end