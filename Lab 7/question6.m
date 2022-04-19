% EMTH 171, Lab 7 
% Question 6
% Logan Lee

clear
clc

t0 = 0.1;
x0 = 0.3;

f = @(t, x) t*x^2*cos(t^2);

f(t0, x0)