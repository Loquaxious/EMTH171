% EMTH 171, Case Study 1
% Exersize 2, Power and speed of a car
% Use Newton's methods to solve for "V"
% Logan Lee and Samuel Thornbury

clear
clc
close all

% Global Variables---------------------------------------------------------
m = 1500; % mass of vehicle (kg)
cD = 0.30; % drag coefficent 
A = 2.0; % frontal area (m^2)
CRR = 0.010; % Coeffeceint depending on wheel and ground properties
R = 0.205; % wheel radius (m)
alpha = 420; % (W.s / rad)
beta = 0.440; % (W.s^2 / rad^2)
dR = 3.5; % final drive ratio
rGB = 0.80; % gearbox ratio
g = 9.81; % gravity (m/s^2)
p = 1.2; % air density (kg / m^3)
K = R/(dR*rGB); 

%**************************************************************************
% Motor Power Ouput and Shaft Speed Plot
%**************************************************************************

% Plotting Preparation-----------------------------------------------------

P_out = @(O) alpha*O - beta*O^2; % Power output
E_speed = [0 : 734]; % Engine Speed

P_outArray = [];
E_speedArray = [];

for ii = [0 : 734]
    P_outArray = [P_outArray, P_out(ii)];
end

% Motor Output / Shaft Speed Plotting-------------------------------------
figure(1)
plot( E_speed, P_outArray);
%title("Power output of a petrol engine as a function of speed");
xlabel("Shaft Speed (Rad/s)");
ylabel("Motor Power (W)");

%************************************************************************** 
% Newton's Method
%**************************************************************************

% Newton's Method Variables------------------------------------------------
V = 55; % Initial Guess of velocity 
N = 20; % Max number of iterations
tol = 0.0001; % Tolerance of V
resultArray = V; % begins the array of results with the initial guess 
iterations = 0; % to calculate number of iterations performed in for loop

% Case Variables-----------------------------------------------------------
a = 0; % Acceleration
theta = (-5 * pi)/180; % Angle of gradient

% Functions----------------------------------------------------------------
f = @(V) cD*A*0.5*p*V^3 + m*g*sin(theta)*V + CRR*m*g*cos(theta)*V... 
    + m*a*V - (alpha*V/K - beta*V^2/K^2);
% Derivative of the above function
d = @(V) 1.5*cD*A*p*V^2 + m*g*sin(theta) + CRR*m*g*cos(theta) + m*a...
    - (alpha/K - 2*beta*V/K^2);

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

% Plotting Newton's Method-------------------------------------------------
figure(2)
plot(iterationsArray, resultArray)
xlabel("Iterations")
ylabel("Velocity (m/s)")

%**************************************************************************
% Case 3
%**************************************************************************

% Case Variables (as stated above)-----------------------------------------
a = 0; % Acceleration
theta = (-5 * pi)/180; % Angle of gradient

% Plotting Preparation for Case--------------------------------------------
% Functions:
Peout = @(v) (alpha * v)/K - (beta*v^2)/K^2; % Power output 
Pd = @(V) cD*A*0.5*p*V^3; % Power dissipated by aerodynamic drag
Prr = @(v) CRR*m*g*cos(theta)*v; % Power dissaipated by rolling resistance
Pgc = @(v) m*g*sin(theta)*v; % Power consumed by climbing a gradient
Pa = @(v) m*a*v; % Power required to accelerate
Ptot = @(v) cD*A*0.5*p*v^3 + m*g*sin(theta)*v + CRR*m*g*cos(theta)*v ...
    + m*a*v; % Total power demand

% Arrays
PeoutArray = [];
PdArray = [];
PrrArray = [];
PgcArray = [];
PaArray = [];
PtotArray = [];

xArray = [0 : 0.1 : 70];

for ii = [0 : 0.1 : 70]
    PeoutArray = [PeoutArray, Peout(ii)];
    PdArray = [PdArray, Pd(ii)];
    PrrArray = [PrrArray, Prr(ii)];
    PgcArray = [PgcArray, Pgc(ii)];
    PaArray = [PaArray, Pa(ii)];
    PtotArray = [PtotArray, Ptot(ii)];
end

% Plotting the results-----------------------------------------------------
figure(3)
plot(xArray,PeoutArray, xArray,PdArray, xArray, PrrArray, xArray, PgcArray, ... 
xArray, PaArray, xArray, PtotArray);

%title("Power Demand Versus Engine Output Power")
legend("Engine Output Power", "Aerodynamic Drag Power", ...
"Rolling Resistance Power", "Gradient Climbing Power", ... 
"Acceleration Power", "Total Power Demand")
xlabel("Road Speed (m/s)")
ylabel("Power (W)")
ylim([-3e4, 15e4]);

V % Display Velocity