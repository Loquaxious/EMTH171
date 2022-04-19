% EMTH 171, Lab 8
% Question, 8
% Logan Lee

clear
clc

% Function 
f = @(x) 22 - 3.*x.^2;
% Interval limits
a = -6;
b = 4;
% Number of strips
n = 1000;

Asum = 0;
xArray = linspace(a, b, n+1);
nStep = length(xArray);

for ii = 2 : nStep - 1
    x = xArray(ii);
    yArray(ii) = f(x);
    Asum = Asum + yArray(ii);
end

disp(Asum);