% EMTH 171, Lab 7 
% Question 9
% Logan Lee

clear
clc

t0 = 0;
x0 = 1;
h = 0.1;

f = @(t, x) -3*t*x;

t = t0 + h
x = x0 + h*f(t0, x0)
