% EMTH 171, Lab 7 
% Question 12, Test  
% Logan Lee

clear
clc

f = @(t, x) -3*t*x;
t0 = 0;
x0 = 3;
n = 10;
tf = 1;
[ tArray, xArray ] = ...
    solveODEEulers( f, t0, x0, tf, n );
fprintf('%.4f\n', tArray);
fprintf('\n');
fprintf('%.4f\n', xArray); 