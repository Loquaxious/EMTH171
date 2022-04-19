clear
clc

x = 9.8;
nTerms = 5;
term = -x^2/(3*6);
partialSum = term

for n = 2 : nTerms
    term = term * ((-1)*x^2 / (3^2* ((2*n+1)*(2*n))));
    partialSum = partialSum + term
end
