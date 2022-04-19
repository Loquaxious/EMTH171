clear
clc

x = 2.8;
nTerms = 5;
term = 3*x^2 / 6;
partialSum = term

for n = 2 : nTerms
    term = term * ((-1)*3^2*x^2 / ((2*n+1)*(2*n)));
    partialSum = partialSum + term
end

