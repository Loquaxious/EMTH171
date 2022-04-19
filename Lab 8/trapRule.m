function [I] = trapRule(f, a, b, n)
%trapRule  Performs the trapezium rule on a function when given the
%appropriate values

dx = (b-a)/n; % Delta x value
Asum = 0; % Initialising the value of the sum
xArray = linspace(a, b, n+1); % xArray
nStep = length(xArray); % number of steps based off of length of x array

for ii = 1 : nStep % Calulating the sum and yArray
    x = xArray(ii);
    yArray(ii) = f(x);
    Asum = Asum + yArray(ii);
end

I = dx*(Asum - 0.5*((yArray(1)+yArray(end)))); % Trapezium Rule 
end

