% EMTH 171, Lab 7 
% Question 22
% Logan Lee

clear
clc
close all

S = 10;
B = 8/3;
R = 613;

f = @(t, x, y, z) S*(y-x);
g = @(t, x, y, z) R*x - y - x*z;
j = @(t, x, y, z)x*y - B*z;

t0 = 0;
x0 = 0.5;
y0 = 0.5;
z0 = 0.5;
tf = 2; % final t value
n = 2000; % number of steps
xArray = x0;
yArray = y0;
zArray = z0;
tArray = linspace(t0, tf, n+1);
h = (tf - t0)/n;

for ii = 1 : n
    xArray(ii +1) = (xArray(ii) + h*f(tArray(ii), xArray(ii), yArray(ii), zArray(ii)));
    yArray(ii +1) = (yArray(ii) + h*g(tArray(ii),xArray(ii), yArray(ii),zArray(ii)));
    zArray(ii+1) = (zArray(ii) + h*j(tArray(ii),xArray(ii), yArray(ii), zArray(ii)));
end

figure(1)
plot(xArray, yArray);
ylabel("y");
xlabel("x");

figure(2)
plot(xArray, zArray);
ylabel("z");
xlabel("x");

figure(3)
plot(yArray, zArray);
ylabel("z");
xlabel("y");

figure(4)
plot3(xArray, yArray, zArray);
ylabel("y");
xlabel("x");
zlabel("z");
view(-20,18); % optional: set a nice view angle for the 3-d plot