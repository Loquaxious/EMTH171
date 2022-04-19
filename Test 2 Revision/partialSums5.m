% EMTH 171  
% Partial Sums 5

clear
clc

x = 1000;
nTerms = 5;
term = 1/(4*2);
partialSums = term

for n = 2 : nTerms
    term = term * ((-1)*x / (4^2 * ((2*n)*(2*n-1))));
    partialSums = partialSums + term
end

