clear; clc;

%%
clear; clc;
statRun = tic;
rng(20190101);
funcParam = evoFuncParams('evoFuncSphere', 2, 100);
algoParam.algoMaxFEval = 1e5 * funcParam.funcDim;
algoParam.algoIniSeed = 20190701;
optRes = evoR1A1ES(funcParam, algoParam);
fprintf('Total runtime: %5.2e.\n', toc(statRun));
disp(evoCheckIsClose(evoFuncSphere(optRes.optx), optRes.opty)); % 1
disp(optRes.opty); % 2.1511e-08
disp(optRes.ccFEval(1)); % 2.1154e+03
