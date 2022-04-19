clear
clc

x = 8.8;
nTerms = 5;
term = x/(4*2);
partialSum = term

for n = 2 : nTerms
    term = term * ((-1)*x^2 / (2^3 *((2*n-1)*(2*n))));
    partialSum = partialSum + term
end

