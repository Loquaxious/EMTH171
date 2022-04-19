clear
clc

x = 5.7;
nTerms = 5;
term = -(x^3)/(2^3*1);
partialSum = term

for n = 2 : nTerms
    term = term * ((-1)*x^2/(2^3*((2*n-1)*(2*n-2))));
    partialSum = partialSum + term
end

