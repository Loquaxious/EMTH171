function [I_lh] = leftHandRule(f, a, b, n)
%leftHandRule Numerical method fro approximating a definite integral

dx = (b-a)/n; % Delta x value
Asum = 0; % Initialising the value of the sum
xArray = linspace(a, b, n+1); % xArray
nStep = length(xArray); % number of steps based off of length of x array

for ii = 1 : nStep-1 % Calulating the sum and yArray
    x = xArray(ii);
    yArray(ii) = f(x);
    Asum = Asum + yArray(ii);
end
I_lh = dx*Asum;
end

