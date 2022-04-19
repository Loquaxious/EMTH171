function [tArray, xArray] = solveODEEulers(f, t0, x0, tf, n)
%solveODEEulers Uses Eulers Method to solve ordinary differetial equations

xArray = x0;
tArray = linspace(t0, tf, n+1);

h = (tf - t0)/n;

for ii = 1 : n
    xArray(ii +1) = (xArray(ii) + h*f(tArray(ii), xArray(ii)));
end

end

