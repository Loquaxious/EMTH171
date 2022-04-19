%Eulers2
%3

clear
clc

Ca = 2:0.1:4;
nStep = length(Ca);
results = zeros(1, nStep);

t0 = 0;
x0 = 4;
tf = 2;
N = 80;
    
for n = 1 : nStep
    
    C = Ca(n);   
    tArray = linspace(t0, tf, N+1);
    h = (tf - t0)/ N;
    xArray = x0;
    f = @(t,x) tanh(x)-log(t + 2) + C;
    
    for j = 1 : N
    xArray(j+1) = (xArray(j) + h*f(tArray(j), xArray(j)));
    end
    
    results(n) = xArray(end);
end
plot(Ca, results);

    