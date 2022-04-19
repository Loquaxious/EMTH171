% EMTH 171, Lab 8
% Question, 16 
% Logan Lee

clear
clc

filename = "VariableDensityRodData11.csv";
fileArray = load(filename);

lengths = fileArray(:,1);
p = fileArray(:,2);
Ac = fileArray(:,3);
L = length(fileArray(:,1));
L0 = 0; % starting length
fL = 11; % final length

% Array of the product of density and cross sectional area
totArray = (p.*Ac).*10e-2;

for n = 1 : L-1
    dx = (lengths(n+1)-lengths(n));
    yArray(n) = dx*((totArray(n) + totArray(n+1))/2);
end
sums = sum(yArray);
disp(sums);
