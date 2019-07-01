clear; clc;

%%
disp(evoGetOutFreqVect(1, 4)'); % 1 2 3 4
disp(evoGetOutFreqVect(1, 5)'); % 1 2 3 4 5
disp(evoGetOutFreqVect(1, 6)'); % 1 2 3 4 5 6

%%
disp(evoGetOutFreqVect(2, 4)'); % 1 2 4
disp(evoGetOutFreqVect(2, 5)'); % 1 2 4 5
disp(evoGetOutFreqVect(2, 6)'); % 1 2 4 6

%%
disp(evoGetOutFreqVect(1000, 1500)'); % 1 1000 1500
disp(evoGetOutFreqVect(1000, 2000)'); % 1 1000 2000
disp(evoGetOutFreqVect(1000, 2500)'); % 1 1000 2000 2500
disp(evoGetOutFreqVect(1000, 3005)'); % 1 1000 2000 3000 3005
