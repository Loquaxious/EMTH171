% EMTH 171, Lab 8
% Question, 15 
% Logan Lee

clear
clc

f = @(x) exp(2*x);
a = 2;
b = 5;
n = 10 : 200;
L = length(n);
true_val = 10985.93382;


for ii = 1 : L
    rArray(ii) = trapRule(f,a,b,n(ii));
    yArray(ii) = abs(true_val - rArray(ii));
    
    lhArray(ii) = leftHandRule(f,a,b,n(ii));
    y_lhArray(ii) = abs(true_val - lhArray(ii));
    
    rhArray(ii) = rightHandRule(f,a,b,n(ii));
    y_rhArray(ii) = abs(true_val - rhArray(ii));
end
plot(n, yArray, n, y_lhArray, n, y_rhArray);
legend("Trapezium Rule", "Left Hand Rule", "Right Hand Rule")