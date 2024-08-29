clear; clc;

Astar = 0:0.01:1 ;
S = 1;
k_plus = 2 ;
kf = 30 ;
Kmf = 0.5 ;
kminus = 5 ;
Kmb = 4;

forward_rate = zeros(length(Astar), 1);
backward_rate = zeros(length(Astar), 1);

for i = 1:length(Astar)
    fprintf("[A*] = %f \n", Astar(i));

    forward = (k_plus * S + kf .* Astar(i)) * (1 - Astar(i));
    backward = kminus .* ((Astar(i))/ (Kmb + Astar(i)));
    
    forward_rate(i) = forward ;
    fprintf("Forward = %f \n", forward(end));
    
    backward_rate(i) = backward ;    
    fprintf("Backward = %f \n", backward(end));

    fprintf("----------------------------------- \n");
end

figure;
plot(Astar, forward_rate, 'r');
hold on;
plot(Astar, backward_rate, 'b');
grid on;