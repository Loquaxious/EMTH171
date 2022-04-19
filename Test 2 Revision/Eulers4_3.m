clear
clc

cArray = 4 : 0.1 : 6;
L = length(cArray);

for ii = 1 : L
    C = cArray(ii);
    t0 = 0;
    x0 = 4;
    tf = 2;
    n = 100;

    f = @(x, t) cos(x^3) + 1/(t+1) - C;

    xArray = x0;
    tArray = linspace(t0, tf, n+1);
    h = (tf - t0)/n;

    for n = 1 : n
        xArray(n+1) = (xArray(n) + h*f(xArray(n), tArray(n)));
    end
    results(ii) = xArray(end);
end

plot(cArray, results);
