clear; clc;

%% true (1)
disp(evoCheckIsPosInt(1));
disp(evoCheckIsPosInt(11));
disp(evoCheckIsPosInt(999));

%% false (0)
disp(evoCheckIsPosInt([1 11 999]));
disp(evoCheckIsPosInt(9.99));
disp(evoCheckIsPosInt(0.01));
disp(evoCheckIsPosInt(0));
disp(evoCheckIsPosInt(-9.99));
disp(evoCheckIsPosInt(-1000));
