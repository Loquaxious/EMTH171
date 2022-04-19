clear 
clc

C = 6;
x0 = -3.0;
n = 3;

f = @(x) 3*x^3 - 3*x + sinh(x) + C;
d = @(x) 9*x^2 - 3 + cosh(x);

xArray = x0;

for n = 1 : n
    xArray(n+1) = (xArray(n) - (f(xArray(n))/d(xArray(n))));
end

disp(xArray(end));
