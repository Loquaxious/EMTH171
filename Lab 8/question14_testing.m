% EMTH 171, Lab 8
% Question 14 testing
% Logan Lee

clear
clc

f = @(x) 22 - 3*x.^2;
xMin = -6;
xMax = 4;
n = 1000;
[ rhInt] = rightHandRule(f, xMin, xMax, n);
fprintf('Int = %.4f\n', rhInt);

g = @(x) x.^3;
xMin = -2;
xMax = 1;
strips = 300;
[ myInt] = rightHandRule(g, xMin, xMax, strips);
fprintf('Int = %.4f\n', myInt);
