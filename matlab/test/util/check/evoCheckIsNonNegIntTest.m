clear; clc;

%% true (1)
disp(evoCheckIsNonNegInt(0));
disp(evoCheckIsNonNegInt(1));
disp(evoCheckIsNonNegInt(11));
disp(evoCheckIsNonNegInt(999));

%% false (0)
disp(evoCheckIsNonNegInt([1 11 999]));
disp(evoCheckIsNonNegInt(9.99));
disp(evoCheckIsNonNegInt(0.01));
disp(evoCheckIsNonNegInt(-9.99));
disp(evoCheckIsNonNegInt(-1000));
