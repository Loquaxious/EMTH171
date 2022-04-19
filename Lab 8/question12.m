% EMTH 171, Lab 8
% Question,12 
% Logan Lee

clear
clc

f = @(x) exp(2*x);
a = 2;
b = 5;
n = 10 : 200;
L = length(n);
rArray = zeros(1,L);
yArray = zeros(1,L);
 
for ii = 1 : L
    rArray(ii) = trapRule(f,a,b,n(ii));
    yArray(ii) = abs(10985.93382 - rArray(ii));
end

plot(n, yArray);