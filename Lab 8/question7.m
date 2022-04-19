% EMTH 171, Lab 8
% Question, 7 
% Logan Lee

clear
clc

% function 
f = @(x) 22 - 3.*x.^2;
% Interval limits
a = 3;
b = 4;
% number of strips
n = 5;

xArray = linspace(a, b, n+1);
yArray = f(xArray);

disp(xArray);
disp(yArray);
