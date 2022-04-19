% EMTH171
% Eg
% Using Euler's Method for solving an ODE
% Demonstrating rounding error using MATLAB's timer function

clear
clc
close all

% variables----------------------------------------------------------------
% function for differential equations
f = @(t, x) 1;
% in this case true solutions is known
f_trueSoln = @(t) t;

% inital conditions
t0 = 0;
x0 = 0;

tf = 1e-1; % final t

nArray = [1, 10, 100, 1000];
nStep = length(nArray);
globalErrorsArray = zeros(1, nStep);
timingArray = zeros(1, nStep);

% Calculations-------------------------------------------------------------
for iStep = 1 : nStep
   
    n = nArray(iStep);
    
    tic; %start timer 
    [tArray, xArray] = solveODEEulers(f, t0, x0, tf, n);
    timingArray(iStep) = toc; % store time taken
    thisGlobalError = abs(xArray(end) - f_trueSoln(tf));
    globalErrorsArray(iStep) = thisGlobalError;
end

figure(1)
% do log log scale plot to show values clearly
loglog(nArray, globalErrorsArray, 'x', 'MarkerSize', 20)
xlabel('Number of steps')
ylabel(sprintf('Global error due to ODE %s', func2str(f)));
ylim([1e-17, 1e-14]);
box off

timingArray % display timing Array
