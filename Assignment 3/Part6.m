clear; clc;

beta = 1;
gamma = 1;
delta = 0.2;
l0 = 4;
p = 4;
sigma = 1;
l_ext = 2.5;

time = 0:0.01:20;

l = 8;
lacY = 3;

l_arr = zeros(length(time), 1);
lacY_arr = zeros(length(time), 1);

for i = 1:length(time)
    l_arr(i) = l;
    lacY_arr(i) = lacY;
    
    dldt = (beta * l_ext * lacY) - (gamma * l);
    dydt = delta + p * (l^4 ./ (l^4 + l0^4)) - (sigma * lacY); 
    
    l = l + dldt;
    lacY = lacY + dydt;

end

disp(l_arr(1:100));
figure;
plot(time, l_arr, 'r');
hold on;
plot(time, lacY_arr, 'b');
title('Red = l & Blue = lacY');
grid on;