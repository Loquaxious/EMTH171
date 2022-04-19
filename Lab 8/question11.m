% EMTH 171, Lab 8
% Question, 11 
% Logan Lee

clear
clc

f = @(x) 22-3.*x.^2;

a = -5;
b = 1;
n = 60;

result = trapRule(f,a, b, n);

disp(result);
% ans = 0.03 as analytically working it out got 6.0