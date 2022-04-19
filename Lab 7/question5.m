% EMTH 171, Lab 7 
% Question 5
% Logan Lee

clear
clc

t0 = 1;
x0 = 4;

f = @(t, x) -(t + 5)*(x/2);

f(t0, x0)