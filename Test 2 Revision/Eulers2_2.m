%Eulers 2
% Eulers

clear
clc

C = 2;
t0 = 0;
x0 = 4;
tf = 2;
n = 80;

f = @(t,x) tanh(x)-log(t + 2) + C;

tArray = linspace(t0, tf, n+1);
h = (tf - t0) / n;
xArray = x0;

for n = 1 : n
    xArray(n+1) = (xArray(n) + h*f(tArray(n), xArray(n)));
end
disp(xArray(end));