% EMTH 171
% Partial Sums 2

clear
clc

x = 18.3;
nTerms = 5;
term = x/(4*2);
partialSums = term

for n = 2 : nTerms
    term = term * (-1*x^2 /(4^2*((2*n) * (2*n-1))));
    partialSums = partialSums + term
end
