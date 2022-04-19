% EMTH 171, Lab 7 
% Question 17
% Logan Lee

clear
clc

f = @(t, x, y) y*t;
g = @(t, x, y) x - y;

t0 = 1;
x0 = 0.1;
y0 = 0.5;

disp(f(t0, x0, y0));
disp(g(t0, x0, y0));
