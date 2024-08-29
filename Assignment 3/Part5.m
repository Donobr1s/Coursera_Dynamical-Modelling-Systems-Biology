clear; clc;

beta = 1;
gamma = 1;
delta = 0.2;
l0 = 4;
p = 4;
sigma = 1;
l = 0:0.1:20;
l_ext = 2.5;

lacY_l_nullcline = zeros(length(l), 1);
lacY_lacY_nullcline = zeros(length(l), 1);

% l - nullcline
for i = 1:length(l)
    lacY = (gamma * l(i)) ./ (beta * l_ext);
    lacY_l_nullcline(i) = lacY;
end

% lacY - nullcline
for i = 1:length(l)
    lacY = 0.2 +  4* ( l(i)^4 / (l(i)^4 + l0^4) );
    lacY_lacY_nullcline(i) = lacY;
end

crossing = [];

for i = 1:length(l)
    if(lacY_lacY_nullcline(i) == lacY_l_nullcline(i))
        disp('Yes');
        crossing(end + 1) = l(i);
    end
end

disp();

figure;
plot(l, lacY_l_nullcline, 'r');
hold on;
plot(l, lacY_lacY_nullcline, 'b');
xlabel('[l]');
ylabel('[lacY]');
title('Red ~ l & Blue ~ lacY');
grid on;
