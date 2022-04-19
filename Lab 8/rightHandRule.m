function [I_rh] = rightHandRule(f, a, b, n)
%rightHandRule for approximating a definite integral 

dx = (b-a)/n; % Delta x value
Asum = 0; % Initialising the value of the sum
xArray = linspace(a, b, n+1); % xArray
nStep = length(xArray); % number of steps based off of length of x array

for ii = 2 : nStep % Calulating the sum and yArray
    x = xArray(ii);
    yArray(ii) = f(x);
    Asum = Asum + yArray(ii);
end
I_rh = dx*Asum;
end

