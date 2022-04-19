%Eulers 2
%PS

clear
clc

x = 5.5;
nTerms = 5;
term = -x/(2*2);
partialSum = term

for n = 2 : nTerms
    term = term * (-1)*x^3 / (4*((2*n)*(2*n-1)));
    partialSum = partialSum + term
end
