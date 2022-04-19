clear
clc

cArray = -1 : 0.1 : 4;
nSteps = length(cArray);
results = zeros(1, nSteps);

for nn = 1 : nSteps
    C = cArray(nn);
    x0 = -1.2;
    n = 5;
    xArray = x0;

    f = @(x) -(2*x^3) + 12*x + 2*cosh(x) + C;
    d = @(x) -(6*x^2) + 12 - 2*sinh(x);

for n = 1 : n
    xArray(n+1) = xArray(n) - (f(xArray(n)) / d(xArray(n)));
end
    results(nn) = xArray(end);
end

plot(cArray, results);
