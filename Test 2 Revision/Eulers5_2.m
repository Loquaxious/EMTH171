clear
clc

C = 2;
t0 = 0;
x0 = 1;
tf = 3;
n = 150;

f = @(x,t) x^2 + tan(t) - C;

tArray = linspace(t0, tf, n+1);
xArray = x0;
h = (tf - t0)/n;

for n = 1 : n
    xArray(n+1) = (xArray(n) + h*f(xArray(n), tArray(n)));
end

disp(xArray(end));
