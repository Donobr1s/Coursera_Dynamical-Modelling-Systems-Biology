clear; clc;

Vin = 0.36 ;
k1 = 0.02 ;
kp = 6 ;
Km = 13;

dt    = 1 ;  
tlast = 500 ; 
 
iterations = round(tlast/dt) ; 
G_arr = zeros(iterations, 1);
ATP_arr = zeros(iterations, 1);

ATP = 4;
G = 3;

for i = 1:iterations 
  ATP_arr(i) = ATP;
  G_arr(i) = G;

  dATP_dt = 2 * k1 * G_arr(i) * ATP_arr(i) - ((kp * ATP_arr(i)) ./ (Km + ATP_arr(i))); 
  dG_dt = Vin - k1 * G_arr(i) * ATP_arr(i);

  ATP = ATP + dATP_dt;
  G = G + dG_dt;
end % of this time step

time = dt*(0:iterations-1)' ;

figure;
plot(time, G_arr, 'r');
hold on;
plot(time, ATP_arr, 'b');
title('[G] Red & [ATP] Blue');
grid on;