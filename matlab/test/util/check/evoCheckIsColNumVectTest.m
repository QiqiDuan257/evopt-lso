clear; clc;

%% true (1)
disp(evoCheckIsColNumVect(0));
disp(evoCheckIsColNumVect([-1 0 1]'));

%% false (0)
disp(evoCheckIsColNumVect([-1 0 1]));
disp(evoCheckIsColNumVect(zeros(3, 2)));
disp(evoCheckIsColNumVect(zeros(3, 2, 1)));
disp(evoCheckIsColNumVect(true));
disp(evoCheckIsColNumVect([true false]'));
