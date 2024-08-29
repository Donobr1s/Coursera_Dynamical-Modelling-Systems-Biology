clear; clc;

beta = 1;
gamma = 1;
delta = 0.2;
l0 = 4;
p = 4;
sigma = 1;
l_ext = 1:7;

time = 0:0.01:20;

l1 = 8;
lacY1 = 3;

l2 = 2;
lacY2 = 1; 

max1_arr = zeros(length(l_ext), 1);
max2_arr = zeros(length(l_ext), 1);

l_arr1 = zeros(length(time), 1);
lacY_arr1 = zeros(length(time), 1);
l_arr2 = zeros(length(time), 1);
lacY_arr2 = zeros(length(time), 1);

for i = 1:length(l_ext)
    for j = 1:length(time)
        l_arr1(i) = l1;
        lacY_arr1(i) = lacY1;
    
        dldt = (beta * l_ext(i) * lacY1) - (gamma * l1);
        dydt = delta + p * (l1^4 ./ (l1^4 + l0^4)) - (sigma * lacY1); 
    
        l1 = l1 + dldt;
        lacY1 = lacY1 + dydt;
    end

    for k = 1:length(time)
        l_arr2(i) = l2;
        lacY_arr2(i) = lacY2;
    
        dldt2 = (beta * l_ext(i) * lacY2) - (gamma * l2);
        dydt2 = delta + p * (l2^4 ./ (l2^4 + l0^4)) - (sigma * lacY2); 
    
        l2 = l2 + dldt2;
        lacY2 = lacY2 + dydt2;
    end

    max1 = max(lacY_arr1);
    max2 = max(lacY_arr2);
    max1_arr(i) = max1;
    max2_arr(i) = max2;
    fprintf("max1 = %f \n", max1);
    fprintf("max2 = %f \n", max2);
end

figure;
plot(max1_arr, l_ext, 'r');
hold on;
plot(max2_arr, l_ext, 'b');
xlabel('l ext');
ylabel('[lacY]');
title('1 = Red 2 = Blue');
grid on;