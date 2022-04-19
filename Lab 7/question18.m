% EMTH 171, Lab 7 
% Question 18
% Logan Lee

clear
clc

f = @(t, x, y) 3*y - 2*x*y;
g = @(t, x, y) 4*x*y - 7*x;

t0 = 1;
x0 = 0.2;
y0 = 0.7;

disp(f(t0, x0, y0));
disp(g(t0, x0, y0));
