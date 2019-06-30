clear; clc;

%%
disp(evoNumScalar2ColNumVect(0, 1)); % 0
disp(evoNumScalar2ColNumVect(-1, 2)'); % -1 -1
disp(evoNumScalar2ColNumVect(0, 3)'); % 0 0 0
disp(evoNumScalar2ColNumVect(1, 2)'); % 1 1

%% unchanged
disp(evoNumScalar2ColNumVect([0 0]', 3)'); % 0 0
disp(evoNumScalar2ColNumVect(true, 2)); % 1
disp(evoNumScalar2ColNumVect({'love', 'EC'}, 1)); % 'love' 'EC'

%% `funcDim` should be a positive integer.
disp(evoNumScalar2ColNumVect(1, 0));
