clear; clc;

%%
ccFEval = [(1000 : -1 : 1) (1 : 1000)];
ccFEval(500) = 700;
ccFEval(1500) = -100;
plot(ccFEval, '.'); hold on;
ccFEval2 = evoZipCcFEval(ccFEval', numel(ccFEval), 50);
scatter(ccFEval2(:, 1),ccFEval2(:, 2), 30); hold on;
ccFEval3 = evoZipCcFEval(ccFEval', numel(ccFEval));
scatter(ccFEval3(:, 1),ccFEval3(:, 2), 120, 'm');
