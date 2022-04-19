
clear
clc


x = 1.8;
nTerms = 5;
term = -(4*x)/(6);
partialSum = term

for n = 2 : nTerms
    term = term * ((-1)*(2^2)*(x^3) / ((2*n+1)*(2*n)));
    partialSum = partialSum + term
end

