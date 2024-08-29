clear; clc;
% Which SET of parameters gives higher amplitude of oscillations

% % Use Euler's method to integrate simple one variable ODE
% % Use program as template for more interesting models

% % Note:  produces slightly different output compared with 
% % example shown in class.  Different values of b, dt, tlast

Vin = [0.2, 0.36, 0.1, 0.36] ;
k1 = [0.02, 0.02, 0.02, 0.02] ;
kp = [5, 4, 6, 6] ;
Km = [13, 15, 12, 9] ;

dt    = 0.2 ;  
tlast = 500 ; 
 
iterations = round(tlast/dt) ; 


time = dt*(0:iterations-1) ;

for j = 1:4
    G = 3;
    ATP = 4;
    G_arr = zeros(iterations, 1);
    ATP_arr = zeros(iterations, 1);
    for i = 1:iterations 
        ATP_arr(i) = ATP;
        G_arr(i) = G;

        dATP_dt = 2 * k1(j) * G_arr(i) * ATP_arr(i) - ((kp(j) * ATP_arr(i)) ./ (Km(j) + ATP_arr(i))); 
        dG_dt = Vin(j) - k1(j) * G_arr(i) * ATP_arr(i);

        ATP = ATP + dATP_dt;
        G = G + dG_dt;
    end

    fprintf("[G] max = %0.5f \n", max(G_arr));
    fprintf("[ATP] max = %0.5f \n", max(ATP_arr));

    figure;
    plot(time, G_arr, 'r');
    hold on;
    plot(time, ATP_arr, 'b');
    title('[G] Red & [ATP] Blue');
    grid on;
    
end

% Answer - Figure 4