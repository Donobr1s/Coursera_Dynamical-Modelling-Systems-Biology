clear; clc;

Astar = 0:0.01:1 ;
Kmb = 0:0.04:4 ;
S = 1;
k_plus = 2 ;
kf = 30 ;
Kmf = 0.5 ;
kminus = 5 ;

forward_rate = zeros(length(Astar), 1);
backward_rate = zeros(length(Astar), 1);

figure;
for i = 1:length(Astar)
    fprintf("[A*] = %f \n", Astar(i));

    forward = (k_plus * S + kf .* Astar(i)) * (1 - Astar(i));
    backward = kminus .* ((Astar(i))/ (Kmb(i) + Astar(i)));
    
    forward_rate(i) = forward ;
    fprintf("Forward = %f \n", forward(end));
    
    backward_rate(i) = backward ;    
    fprintf("Backward = %f \n", backward(end));

    fprintf("----------------------------------- \n");
    plot(Kmb(i), Astar(i), 'bo-');
    hold on;
end

grid on;