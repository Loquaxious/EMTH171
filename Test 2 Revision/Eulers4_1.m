clear
clc

x = 5.8;
nTerms = 5;
term = (2*6) / x^2;
partialSum = term

for n = 2 : nTerms
    term = term * ((-1)*(2^3)*((2*n+1)*(2*n))/ x^2);
    partialSum = partialSum + term
end

