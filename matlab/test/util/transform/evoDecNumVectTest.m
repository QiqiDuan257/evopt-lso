clear; clc;

%%
disp(evoDecNumVect(0)); % 0
disp(evoDecNumVect(1 : 5)); % [1 1 1 1 1]
disp(evoDecNumVect(5 : -1 : 1)); % [5 4 3 2 1]
disp(evoDecNumVect([2 1 3 1 0])); % [2 1 1 1 0]
disp(evoDecNumVect((1 : 5)')'); % [1 1 1 1 1]
disp(evoDecNumVect((5 : -1 : 1)')'); % [5 4 3 2 1]
disp(evoDecNumVect([2 1 3 1 0]')'); % [2 1 1 1 0]

%% the input should be a numeric vector.
evoDecNumVect(ones(2, 2));

%% the input should be a numeric vector.
evoDecNumVect([true false]);
