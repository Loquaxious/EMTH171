% EMTH 171, Lab 7 
% Question 11 
% Logan Lee

clear
clc
close all

t0 = 0;
x0 = 3;
n = 10;
tf = 1;

xArray = x0;
tArray = linspace(t0, tf, n+1);

h = (tf - t0)/n;

f = @(t, x) -3*t*x;

for ii = 1 : n
    xArray(ii +1) = (xArray(ii) + h*f(tArray(ii), xArray(ii)));
end

plot(tArray, xArray);
xlabel("t")
ylabel("x")