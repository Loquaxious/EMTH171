% EMTH 171, Lab 7 
% Question 16
% Logan Lee

clear
clc
close all

r = 0.043;
Ta = 20;

% Function
f = @(t, x) -r*(x - Ta);

% Inital Conditions
t0 = 0;
x0 = 100;

tf = 70; % final t value
n = 7000; % number of steps
targetTemp = 40;
xArray = x0;
tArray = linspace(t0, tf, n+1);
h = (tf - t0)/n;

for ii = 1 : n+1
    xArray(ii +1) = (xArray(ii) + h*f(tArray(ii), xArray(ii)));
end

firstIndex = find(xArray <= targetTemp, 1);
tArray(firstIndex)
xArray(firstIndex)