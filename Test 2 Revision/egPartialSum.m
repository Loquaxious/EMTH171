% EMTH 171 Lab 2
% Question 30, 
% Logan Lee

clear 
clc

x = 1.6; % values of x to calculate 
nTerms = 5; % number of terms
term = x^2; % first term
partialSum = term; 
partialSumsArray(1) = partialSum; % store first partial sum

for n = 2 : nTerms
  term = term * ((-1 * x^2) / ((2*n - 1) * (2*n - 2)));
  partialSum = partialSum + term;
  partialSumsArray(n) = partialSum;
end

disp(partialSumsArray);