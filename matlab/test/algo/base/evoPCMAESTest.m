clear; clc;

%%
clear; clc;
statRun = tic;
rng(20190101);
funcParam = evoFuncParams('evoFuncSphere', 2, 100);
algoParam.algoMaxFEval = 1e5 * funcParam.funcDim;
algoParam.algoIniSeed = 20190701;
optRes = evoPCMAES(funcParam, algoParam);
fprintf('Total runtime: %5.2e.\n', toc(statRun));
disp(evoCheckIsClose(evoFuncSphere(optRes.optx), optRes.opty)); % 1
disp(optRes.opty); % 0
disp(optRes.curveFEval(1, 2)); % 2.1154e+03
