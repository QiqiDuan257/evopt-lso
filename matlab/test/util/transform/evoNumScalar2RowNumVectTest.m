clear; clc;

%%
disp(evoNumScalar2RowNumVect(0, 1)); % 0
disp(evoNumScalar2RowNumVect(-1, 2)); % -1 -1
disp(evoNumScalar2RowNumVect(0, 3)); % 0 0 0
disp(evoNumScalar2RowNumVect(1, 2)); % 1 1

%% unchanged
disp(evoNumScalar2RowNumVect([0 0], 1)); % 0 0
disp(evoNumScalar2RowNumVect(true, 2)); % 1
disp(evoNumScalar2RowNumVect({'love', 'EC'}, 3)); % 'love' 'EC'

%% `funcDim` should be a positive integer.
disp(evoNumScalar2RowNumVect(1, 0));
