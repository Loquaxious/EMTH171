% EMTH 171, Lab 7 
% Question 20
% Logan Lee

clear
clc

f = @(t, x, y) y*t;
g = @(t, x, y) x - y;

t0 = 1;
x0 = 0.1;
y0 = 0.5;
tf = 2; % final t value
n = 2; % number of steps
xArray = x0;
yArray = y0;
tArray = linspace(t0, tf, n+1);
h = (tf - t0)/n;

for ii = 1 : n
    xArray(ii +1) = (xArray(ii) + h*f(tArray(ii), xArray(ii), yArray(ii)));
    yArray(ii +1) = (yArray(ii) + h*g(tArray(ii),xArray(ii), yArray(ii)));
end

disp(tArray);
disp(xArray);
disp(yArray);
