clear; clc;

% https://en.wikipedia.org/wiki/Orthogonal_matrix

%% true (1)
A = [1 0; ...
    0 1];
disp(evoCheckIsOrthMatrix(A));
disp(evoCheckIsOrthMatrix(A'));
B = [0.96 -0.28; ...
    0.28 0.96];
disp(evoCheckIsOrthMatrix(B));
disp(evoCheckIsOrthMatrix(B'));
C = [1 0; ...
    0 -1];
disp(evoCheckIsOrthMatrix(C));
disp(evoCheckIsOrthMatrix(C'));
D = [0 -0.80 -0.60; ...
    0.80 -0.36 0.48; ...
    0.60 0.48 -0.64];
disp(evoCheckIsOrthMatrix(D));
disp(evoCheckIsOrthMatrix(D'));
E = [0 0 0 1; ...
    0 0 1 0; ...
    1 0 0 0; ...
    0 1 0 0];
disp(evoCheckIsOrthMatrix(E));
disp(evoCheckIsOrthMatrix(E'));
F = [1/sqrt(2) 1/2 1/2; ...
    0 sqrt(2)/2 -sqrt(2)/2; ...
    -1/sqrt(2) 1/2 1/2];
disp(evoCheckIsOrthMatrix(F));
disp(evoCheckIsOrthMatrix(F'));
G = [1/sqrt(2) 1/sqrt(2); ...
    1/sqrt(2) -1/sqrt(2)];
disp(evoCheckIsOrthMatrix(G));
disp(evoCheckIsOrthMatrix(G'));
H = [0.8, -0.6; ...
    0.6 0.8];
disp(evoCheckIsOrthMatrix(H));
disp(evoCheckIsOrthMatrix(H'));

%% false (0)
A = [1/sqrt(2) 1/sqrt(2); ...
    1/sqrt(2) 1/sqrt(2)];
disp(evoCheckIsOrthMatrix(A));

%% the input should be a square matrix.
evoCheckIsOrthMatrix(ones(2, 3));
