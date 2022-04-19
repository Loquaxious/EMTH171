% EMTH 171, Case Study 2
% Task 2b
% Mass and Energy Balances Applied to Electricity Generation
% Eulers Method
% Logan Lee 

clear
clc
close all

% *************************************************************************
% Variables
% *************************************************************************
%------------------------ Global Variables --------------------------------
p = 998; % Density (kg/m^3)   
g = 9.81; % Gravity (m/s^2)
K = 1.55; % A constant (m^1.5/s)
L = 300; % Length of spillway wier (m)
mean = 5000; % Mean of normal distrubution
sd = 1000; % Standard Deviation
P_geo = 1605 * 0.95; % Geothermal Power (MW)
P_w = 4130; % Wind Power (MW)

% Pre allocating Arrays
h_NIArray = zeros(0,8761);
h_SIArray = zeros(0,8761);
dV_NIspillArray = zeros(0,8761);
dV_SIspillArray = zeros(0,8761);
dh_NIArray = zeros(0,8761);
dh_SIArray = zeros(0,8761);

%------------------ North Island Specific Variables -----------------------
A_NI = 620e6; % Area of lake North Island (m^2)
h_NIArray = 356.55; % Height of North Island Lake (m)
h_NIgen = 80; % Generator height North Island (m)
P_NIw = P_w/2; % Wind Power in the North Island (MW)
h_NIw = 357.25; % North Island Wier hieght (m)

%------------------ South Island Specific Variables -----------------------
A_SI = 350e6; % South Island Lake Area (m^2)
P_SIw = P_w/2; % South Island Wind Power (MW)
h_SIArray = 406; % Height of South Island Lake (m)
h_SIgen = 0; % Height of Generator South Island (m)
h_SIw = 410; % South Island wier height (m)

% *************************************************************************
% Euler's Method
% *************************************************************************
t0 = 0; % Initial time (s)
tf = 8760; % Final time (s)
tArray = t0 : tf; % Time array from initial to final Time
h = 1 * 3600; % Step size, 3600 for unit balancing

%Intialising the h_SI min for while loop
h_SIArrayMin = 400.00;
h_SImin = 402;

disp(P_NIw);
 
 while h_SIArrayMin < h_SImin
    P_geo = P_geo + 5;
    
    % Pre allocating Arrays
    h_NIArray = zeros(0,8761);
    h_SIArray = zeros(0,8761);
    dV_NIspillArray = zeros(0,8761);
    dV_SIspillArray = zeros(0,8761);
    dh_NIArray = zeros(0,8761);
    dh_SIArray = zeros(0,8761);
    
    
    % Initialising the arrays for each equation with their inital values 
    h_NIArray(1) = 356.55; % Height of North Island Lake (m)
    h_SIArray(1) = 406; % Height of South Island Lake (m)
    dV_NIspillArray(1) = 0; 
    dV_SIspillArray(1) = 0;
    dh_NIArray(1) = 356.55;
    dh_SIArray(1) = 406;
     
    for n = 2 : length(tArray)

        t = tArray(n-1);

        % North and South Island power demands
        P_NIdem = 4065 + 1.4e6*normpdf(t, mean, sd);
        P_SIdem = 1940;

        % North and South Island inlet flow Rate
        F_NIin = 345 + 73*sin((2*pi*(t-3624))/8760); 
        F_SIin = 593 - 183*sin((2*pi*(t-2320))/8760); 

        % North Island Flow generation
        F_NIgen = F_NIin;

        % Power Generated by hydro
        P_NIhydro = (0.9*F_NIgen*p*g*(h_NIArray - h_NIgen))/1e6;

        % Capacity Factor of wind turbines
        CF = 0.41 + 0.12*sin((2*pi*(t - 5660))/8760);

        % Total Power produced on North Island
        P_NItot = P_NIhydro + P_geo + P_NIw*CF;

        % Electrical power balance for the Islands
        P_HVDC = P_NIdem - P_NItot;

        % The amount of hydro power required for South Island
        P_SIhydro = P_SIdem + P_HVDC - P_SIw*CF;

        % Generating flow rate for South Island
        F_SIgen = (P_SIhydro*1e6)/(0.9*p*g*(h_SIArray - h_SIgen));

        % Spillway flow for each lake
        %North Island
        if h_NIArray(n-1) > h_NIw
            F_NIspill = K*L*(h_NIArray(n-1) - h_NIw)^1.5;
        else
            F_NIspill = 0;
        end
        %South Island
        if h_SIArray(n-1) > h_SIw
            F_SIspill = K*L*(h_SIArray(n-1) - h_SIw)^1.5;
        else
            F_SIspill = 0;
        end

        % The differential Equations
        dV_NIspill = @(t) F_NIspill; % Spill Volume of the North Island (m^3)
        dV_SIspill = @(t) F_SIspill; % Spill Volume of the South Island (m^3)
        dh_NI = @(t) (F_NIin - F_NIgen - F_NIspill)/A_NI; % Lake Height of North Island (mm)
        dh_SI = @(t) (F_SIin - F_SIgen - F_SIspill)/A_SI; % Lake Height of South Island (mm)

        h_NIArray(n) = h_NIArray(n-1) + dh_NI(t)*3600;
        h_SIArray(n) = h_SIArray(n-1) + dh_SI(t)*3600;

        dV_NIspillArray(n) = dV_NIspillArray(n-1) + h*dV_NIspill(tArray(n-1));
        dV_SIspillArray(n) = dV_SIspillArray(n-1) + h*dV_SIspill(tArray(n-1));
        dh_NIArray(n) = dh_NIArray(n-1) + h*dh_NI(tArray(n-1));
        dh_SIArray(n) = dh_SIArray(n-1) + h*dh_SI(tArray(n-1));
    end
    h_SIArrayMin = min(h_SIArray); % Minimum height of the South Island lake
    disp(h_SIArrayMin);
 end


 geothermalPower = P_geo