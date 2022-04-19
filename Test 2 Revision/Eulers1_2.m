%EulersV1
%EulersQ

clear
clc

C = 3;
t0 = 0;
x0 = 3;
tf = 3;
n = 150;

f = @(t,x) sin(x) - cosh(t) - C;

xArray = x0;
tArray = linspace(t0, tf, n+1);
h = (tf - t0)/n;

for n = 1 : n
    xArray(n+1) = (xArray(n) + h*f(tArray(n), xArray(n)));
end
disp(xArray(end));
