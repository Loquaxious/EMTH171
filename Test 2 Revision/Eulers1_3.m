%EulersV1
%EulersQ

clear
clc

CArray = 3 : 0.1 : 5;
nStep = length(CArray);

t0 = 0;
x0 = 3;
tf = 3;
n = 150;

for i = 1 : nStep
    xArray = x0;
    tArray = linspace(t0, tf, n+1);
    h = (tf - t0)/n;
    C = CArray(i);
    
     f = @(t,x) sin(x) - cosh(t) - C;

    for n = 1 : n
        xArray(n+1) = (xArray(n) + h*f(tArray(n), xArray(n)));
    end
    resultsArray(i) = xArray(end);
end

plot(CArray, resultsArray);
