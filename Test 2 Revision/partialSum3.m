% EMTH 171
% Partial Sum 3

clear
clc

x = 2.8;
nTerms = 5;
term = 2*x^3 / 2;
partialSums = term

for n = 2 : nTerms
    term = term * ((-1)*(2^2)*(x^3) / ((2*n) * (2*n-1)));
    partialSums = partialSums + term
end

