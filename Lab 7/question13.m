% EMTH 171, Lab 7 
% Question 13 
% Logan Lee

clear
clc
close all

% Variables----------------------------------------------------------------

% Function for differential equations
f = @(t, x) t*x^2*cos(t^2);

% inital condions
t0 = 0;
x0 = 1; % ie, x(t0)

tf = 5; % final t

% array of n to use and colours for plots 
nArray = [50 100 500];
colArray = ["b", "c" "g"];
nStep = length(nArray);

figure(1) % figure to plot onto in loop
hold on % be bale to add to plot in loop

for iStep = 1 : nStep
    n = nArray(iStep);
    [tArray, xArray] = solveODEEulers(f, t0, x0, tf, n);
    
    plot(tArray, xArray, "x", "color", colArray(iStep));
end

% complete plot
hold off
title('Demonstrate effect of h using Euler''s Method');
xlabel('t');
ylabel('x');
legend('n=50', 'n=100', 'n=500', ...
    'Location', 'Best');
