% EMTH 171, Lab 7
% Question 15
% Logan Lee

clear
clc
close all

cArray = [-5 : 1 : -1];
nStep = length(cArray);

% Inital Conditions
t0 = 0;
x0 = 4;

tf = 5; % final t value
n = 250; % number of steps

for nn = 1 : nStep
    xArray = x0;
    tArray = linspace(t0, tf, n+1);
    h = (tf - t0)/n;    
    C = cArray(nn);
    % function
    f = @(t, x) 1/x^3 + t^2 + tanh(2*t) + C;   
    

for ii = 1 : n
    xArray(ii+1) = (xArray(ii) + h.*f(tArray(ii), xArray(ii)));
end
    resultArray(nn) = xArray(end);
end

plot(cArray, resultArray);
