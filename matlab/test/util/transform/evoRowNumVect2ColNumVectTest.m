clear; clc;

%%
disp(evoRowNumVect2ColNumVect(7)); % 7
disp(evoRowNumVect2ColNumVect([1 -1])'); % 1 -1

%%
disp(evoRowNumVect2ColNumVect((1 : 3)')'); % 1 2 3
disp(evoRowNumVect2ColNumVect([true false])); % 1 0
disp(evoRowNumVect2ColNumVect(ones(3, 2)));
% 1 1
% 1 1
% 1 1
