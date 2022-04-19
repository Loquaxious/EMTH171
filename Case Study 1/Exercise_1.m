% EMTH 171, Case Study 1
% Exercise 1, Sled haulage problem
% Use Newton's methods to solve for "V"
% Logan Lee, Samuel Thornbury 

clear
clc
close all

% Global Variables---------------------------------------------------------
alpha = 1; % constant of multiplication (W.S^2.rads^2)
beta = 100 * pi; % constant of multiplication (rads^-1)
rGB = 20; % Gear ratio
R = 0.5; % Radius of drum(m)
m = 1000; % Total mass of sled (kg) 
g = 9.81; % Gravity (ms^-2)
theta = pi/4; % Angle of ramp (degrees) 
cF = 0.2; % Coefficient of friction

%**************************************************************************
% Motor Power Ouput and Shaft Speed Plot
%**************************************************************************

%Plotting Preparation-----------------------------------------------------

P_out = @(O) alpha*(beta*O - O^2); % Power output
P_demand = @(v) (m*g*sin(theta)*v) + (cF*m*g*cos(theta)*v); % Power demand

sledSpeed = [0:0.1:8];
P_outArray = [];
P_demandArray = [];

for ii = sledSpeed
    P_outArray = [P_outArray, P_out((ii * rGB) / R)];
    P_demandArray = [P_demandArray, P_demand(ii)];
end

% Motor Output / Shaft Speed Plotting-------------------------------------
figure(1)
plot(sledSpeed, P_outArray, sledSpeed, P_demandArray);
%title("Motor Output Power Versus Shaft Speed");
legend("Power Output", "Power demand")
xlabel("Shaft Speed (RPM)");
ylabel("Motor Power (W)");

%************************************************************************** 
% Newton's Method
%**************************************************************************
 
% Newtons Method Variables-------------------------------------------------
V = 2; % Initial Guess of velocity 
N = 20; % Max number of iterations
tol = 0.0001; % Tolerance of V
resultArray = V; % begins the array of results with the initial guess 
iterations = 0; % to calculate number of iterations performed in for loop

% Functions----------------------------------------------------------------
f = @(V) (((m*g)*sin(theta)*V) + ((cF*(m*g))*cos(theta)*V)...
    - alpha*(beta*((rGB*V)/R) - (((rGB^2) * V^2)/R^2)));
% Derviavtive of the above function
d = @(V) (((m*g)*sin(theta)) + ((cF*(m*g))*cos(theta))...
    - alpha*(beta*(rGB/R) - (((2*(rGB^2))*V)/R^2)));

% Newton's method for-loop-------------------------------------------------
for n = 1 : N
    iterations = iterations + 1;
    oldV = V;
    V = (V - (f(V) ./ d(V)));
    resultArray = [resultArray; V];
    if (abs(f(V)) < tol) && (abs(oldV - V) < tol)  
        break
    end
end

iterationsArray = [0: iterations];

%Plotting the results------------------------------------------------------
figure(2)
plot(iterationsArray, resultArray)
xlabel("Iterations")
ylabel("Optimum sled speed (ms^-1)")

