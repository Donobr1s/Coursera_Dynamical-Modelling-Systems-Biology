clear; clc;

l = [0.5, 3.065, 10.276];
for i = 1:3
    J = [-1 2.5; ((4096 * l(i)^3)/(l(i)^4 + 256)^2) -1];
    fprintf("l = %f \n", l(i));
    fprintf("Eigenvalues: \n")
    disp(eig(J));
end