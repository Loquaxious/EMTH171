%Newtons 1
%PSQ

x = 7.3;
nTerms = 5;
term = 4*2 / x;
partialSum = term

for n = 2 : nTerms
    term = term * ((-1)*8*((2*n)*(2*n-1)) / x^2);
    partialSum = partialSum + term
end
