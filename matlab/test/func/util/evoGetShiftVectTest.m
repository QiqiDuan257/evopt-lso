clear; clc;

%%
disp(evoGetShiftVect(1, 0, 0)); % 0.8147
disp(evoGetShiftVect([1 2]', [-1 -2]', 0)'); % 0.6294 1.6232
disp(evoGetShiftVect([1 2], [-1 -2], 0)'); % 0.6294 1.6232
disp(evoGetShiftVect([1 2], [-1 -2]', 0)'); % 0.6294 1.6232
disp(evoGetShiftVect([1 2]', [-1 -2], 0)'); % 0.6294 1.6232

%% `size(funcUB)` shoud equal `size(funcLB)`.
evoGetShiftVect([1 2 3]', [1 2]', 0);

%% `funcUB` should be a column numeric vector.
evoGetShiftVect(ones(2, 3), -ones(2, 3), 0);
