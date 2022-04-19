clear
clc

C = 10;
x0 = 1.1;
n = 3;
xArray = x0;

f = @(x) 2*x^3 + 5*x + sinh(x) + C;
d = @(x) 6*x^2 + 5 + cosh(x);

for n = 1 : n
    xArray(n+1) = (xArray(n) - (f(xArray(n))/d(xArray(n))));
end

disp(xArray(end));
