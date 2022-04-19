clear
clc

C = -1;
x0 = -1.2;
n = 5;
xArray = x0;

f = @(x) -(2*x^3) + 12*x + 2*cosh(x) + C;
d = @(x) -(6*x^2) + 12 - 2*sinh(x);

for n = 1 : n
    xArray(n+1) = xArray(n) - (f(xArray(n)) / d(xArray(n)));
end
disp(xArray(end));
