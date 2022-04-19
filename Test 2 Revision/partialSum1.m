% EMTH 171
% Test 2 revision
% Partial Sums

clear
clc

x = 12.5;
term = x^2/(3*(6)); % 6 being 3!
nTerms = 5;
partialSum = term

for n = 2 : nTerms
    term = term * (-1)*x^2 / (3^2 * ((2*n) * (2*n+1)));
    partialSum = partialSum + term
end

