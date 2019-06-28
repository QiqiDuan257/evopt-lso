clear; clc;

%% true (1)
disp(evoCheckIsClose(ones(1), ones(1)));
disp(evoCheckIsClose(ones(1, 2), ones(1, 2)));
disp(evoCheckIsClose(ones(3, 1), 1e-25 + ones(3, 1)));
disp(evoCheckIsClose(ones(3, 4), ones(3, 4) - 1e-25));
disp(evoCheckIsClose(ones(3, 4), ones(3, 4) - 1e-2, 1e-1));

%% false (0)
disp(evoCheckIsClose(ones(1), 1e-6 + ones(1)));
disp(evoCheckIsClose(ones(1, 2), 1e-7 + ones(1, 2)));
disp(evoCheckIsClose(ones(3, 1), 1e-7 + ones(3, 1)));
disp(evoCheckIsClose(ones(3, 4), ones(3, 4) - 1e-8));
disp(evoCheckIsClose(ones(3, 4), ones(3, 4) - 1e-2, 1e-2));

%% ERROR: two numeric matrices should have the same size
disp(evoCheckIsClose(ones(2, 3), ones(3, 2)));
