% EMTH 171
% Eg
% Using Eulers Method for solving an ODE
% Demonstrate effect of changing numbers of steps

clear
clc
close all

% Variables

% Function for differential equations
f = @(t, x) x;

% inital condions
t0 = 0;
x0 = 1; % ie, x(t0)

tf = 3; % final t

% array of n to use and colours for plots 
nArray = [30 60 300];
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
legend('n=30', 'n=60', 'n=300', ...
    'Location', 'Best');
