% EMTH 171
% Partial Sum 4

clear
clc

x = 10;
nTerms = 5;
term = ((3^3) * (2))/ x^3;
partialSums = term

for n = 2 : nTerms
    term = term * ((-1)*(3^2)*((2*n)*(2*n-1)) / x^2);
    partialSums = partialSums + term
end

