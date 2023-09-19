function tax = calculate_tax(income)
% Input: income in $
% Output: tax in $ according to tax brackets
% You will need to use if/else to determine the appropriate tax bracket
if 0<= income & income<=18200
    tax=0
end
if 18201<= income & income<=37000
    tax=0.19*(income-18200)
end
if 37001<= income & income<=90000
    tax=3572+0.325*(income-37000)
end
if 90001<= income & income<=180000
    tax=20797+0.37*(income-90000)
end
if income>180001
    tax=54096+0.45*(income-180000)
end