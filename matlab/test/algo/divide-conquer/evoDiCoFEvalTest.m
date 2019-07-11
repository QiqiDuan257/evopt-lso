clear; clc;

%%
disp(evoDiCoFEval((2 : 2 : 10)', ones(10, 1), 2 : 2 : 10)');
disp(evoDiCoFEval((2 : 2 : 10)', ones(10, 1), (2 : 2 : 10)')');
% 1 2 1 4 1 6 1 8 1 10

%%
disp(evoDiCoFEval([-1 -3; -1 -3], (1 : 5)', [2 4]));
disp(evoDiCoFEval([-1 -3; -1 -3], (1 : 5)', [2 4]'));
%      1     1
%     -1    -3
%      3     3
%     -1    -3
%      5     5

%%
disp(evoDiCoFEval([1 4 7; 2 5 8; 3 6 9], (101 : 110)', [1 2 11]));
disp(evoDiCoFEval([1 4 7; 2 5 8; 3 6 9], (101 : 110)', [1 2 11]'));
%      1     4     7
%      2     5     8
%    103   103   103
%    104   104   104
%    105   105   105
%    106   106   106
%    107   107   107
%    108   108   108
%    109   109   109
%    110   110   110
%      3     6     9