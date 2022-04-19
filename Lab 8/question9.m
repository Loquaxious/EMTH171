% EMTH 171, Lab 8
% Question, 9
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
% Strip width
dx = (b-a)/n;

Asum = 0;
xArray = linspace(a, b, n+1);
nStep = length(xArray);

for ii = 1 : nStep
    x = xArray(ii);
    yArray(ii) = f(x);
    Asum = Asum + yArray(ii);
end

I = dx*(Asum - 0.5*((yArray(1)+yArray(end))));

disp(I);