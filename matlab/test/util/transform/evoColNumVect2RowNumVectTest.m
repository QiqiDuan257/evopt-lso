clear; clc;

%%
disp(evoColNumVect2RowNumVect(7)); % 7
disp(evoColNumVect2RowNumVect([1 -1]')); % 1 -1

%%
disp(evoColNumVect2RowNumVect(1 : 3)); % 1 2 3
disp(evoColNumVect2RowNumVect([true false]')'); % 1 0
disp(evoColNumVect2RowNumVect(ones(2, 3)));
% 1 1 1
% 1 1 1
