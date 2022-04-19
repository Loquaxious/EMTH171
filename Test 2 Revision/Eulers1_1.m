% Emth 171 
% Eulers Varaint v1
% Partial Sum

clear
clc

x = 1.8;
nTerms = 5;
term = -(4*x / 6);
partialSum = term

for n = 2 : nTerms
    term = term * ((-1^(n-1))*4*x^3 / ((2*n)*(2*n+1)));
    partialSum = partialSum + term
end

