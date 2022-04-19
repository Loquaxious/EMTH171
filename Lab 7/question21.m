% EMTH 171, Lab 7 
% Question 21
% Logan Lee

clear
clc
close all

m = @(t, m, e) 2/3 * m - 4/3*m*e;
e = @(t, m, e) -e + m*e;

t0 = 0;
m0 = 1;
e0 = 1;
tf = 15; % final t value
n = 1500; % number of steps
mArray = m0;
eArray = e0;
tArray = linspace(t0, tf, n+1);
h = (tf - t0)/n;

for ii = 1 : n
    mArray(ii +1) = (mArray(ii) + h*m(tArray(ii), mArray(ii), eArray(ii)));
    eArray(ii +1) = (eArray(ii) + h*e(tArray(ii),mArray(ii), eArray(ii)));
end

plot(tArray, mArray, tArray, eArray);
legend("Moa", "Eagle");
ylabel("Populations (100s)");
xlabel("t");
