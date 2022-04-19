% EMTH 171, Lab 7 
% Question 14
% Logan Lee

clear
clc
close all

% Function
f = @(t, x) 1/x^3 + t^2 + tanh(2*t) - 5;

% Inital Conditions
t0 = 0;
x0 = 4;
C = -5;

tf = 5; % final t value
n = 250; % number of steps

xArray = x0;
tArray = linspace(t0, tf, n+1);
h = (tf - t0)/n;

for ii = 1 : n
    xArray(ii +1) = (xArray(ii) + h*f(tArray(ii), xArray(ii)));
end
len = length(xArray);
disp(xArray(len));

