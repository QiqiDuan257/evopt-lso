clear; clc;

%% true (1)
disp(evoCheckIsColPosIntVect(1));
disp(evoCheckIsColPosIntVect([1 2]'));
disp(evoCheckIsColPosIntVect([3 2 1]'));

%% false (0)
disp(evoCheckIsColPosIntVect(-1));
disp(evoCheckIsColPosIntVect(0));
disp(evoCheckIsColPosIntVect([1 2]));
disp(evoCheckIsColPosIntVect([3 2 0]'));
disp(evoCheckIsColPosIntVect(ones(2, 2)));
disp(evoCheckIsColPosIntVect([true false]'));
