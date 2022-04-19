
c = -8;
x0 = -0.8;
n = 3;
xArray = x0;

f = @(x) 2*x^2 + 5*x - 2*cos(x) + c;
d = @(x) 4*x + 5 + 2*sin(x);

for n = 1 : n
 xArray(n+1) = xArray(n) - (f(xArray(n))/d(xArray(n)));
end

disp(xArray(end));
