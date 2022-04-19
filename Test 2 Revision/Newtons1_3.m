cArray = -8:0.1:-3;
L = length(cArray);
for i = 1 : L
    C = cArray(i);
    x0 = -0.8;
    n = 3;
    xArray = x0;

    f = @(x) 2*x^2 + 5*x - 2*cos(x) + C;
    d = @(x) 4*x + 5 + 2*sin(x);

    for n = 1 : n
     xArray(n+1) = xArray(n) - (f(xArray(n))/d(xArray(n)));
    end
    resultsArray(i) = xArray(end);
end
plot(cArray, resultsArray);

