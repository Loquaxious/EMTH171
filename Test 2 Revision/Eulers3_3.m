clear
clc

cArray = 1 : 0.1 : 3.0;
L = length(cArray);

for ii = 1 : L
    C = cArray(ii);
    t0 = 0;
    x0 = 5;
    tf = 3;
    n = 150;

    f = @(t, x) cos(x) - t^2 + C;

    xArray = x0;
    tArray = linspace(t0, tf, n+1);
    h = (tf - t0) / n;

    for n = 1 : n
        xArray(n+1) = (xArray(n) + h*f(tArray(n), xArray(n)));
    end
    results(ii) = xArray(end);
end

plot(cArray, results)