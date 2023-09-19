% Random vector of Reynolds numbers
Re = randi([0 10000],1,1000);

% Calculate f below
absrough=3*10^-6
D=200*10^-3
f=zeros(size(Re))
for n=1:length(Re)
    if Re(n)<2000
    f(n)=64./Re(n)                                 %  Laminar flow
    else
    f(n)=(1./(-1.8.*log10((6.9./Re(n))+((absrough./D)./3.7).^1.11))).^2   %  Turbulent flow  Haaland approximation
    end
    n=n+1
end