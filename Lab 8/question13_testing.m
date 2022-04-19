% EMTH 171, Lab 8
% Question 13 testing
% Logan Lee

clear
clc

f = @(x) 22 - 3*x.^2;
xMin = -6;
xMax = 4;
n = 1000;
[ lhInt] = leftHandRule(f, xMin, xMax, n);
fprintf('Int = %.4f\n', lhInt);

g = @(x) x.^3;
xMin = -2;
xMax = 1;
strips = 300;
[ myInt] = leftHandRule(g, xMin, xMax, strips);
fprintf('Int = %.4f\n', myInt);