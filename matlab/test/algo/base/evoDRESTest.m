clear; clc;

%%
clear; clc;
statRun = tic;
rng(20190101);
funcParam = evoFuncParams('evoFuncSphere', 2, 100);
algoParam.algoMaxFEval = 1e5 * funcParam.funcDim;
algoParam.algoIniSeed = 20190701;
optRes = evoDRES(funcParam, algoParam);
fprintf('Total runtime: %5.2e.\n', toc(statRun));
disp(evoCheckIsClose(evoFuncSphere(optRes.optx), optRes.opty)); % 1
disp(optRes.opty); % 0
disp(optRes.ccFEval(1)); % 2.1154e+03

%%
clear; clc;
statRun = tic;
rng(20190101);
funcParam = evoFuncParams('evoFuncHyperEllipsoid', 30, 100);
algoParam.algoMaxFEval = 2.5e4;
algoParam.algoIniX = ones(30, 1);
algoParam.algoPopSize = 10;
algoParam.algoStopy = 1e-10;
optRes = evoDRES(funcParam, algoParam);
fprintf('Total runtime: %5.2e.\n', toc(statRun));
disp(evoCheckIsClose(evoFuncHyperEllipsoid(optRes.optx), optRes.opty)); % 1
disp(optRes.opty); % 9.0493e-11
disp(optRes.ccFEval(1)); % 9455
semilogy(optRes.ccFEval, 'm.'); xlim([0 2.5e4]); ylim([1e-10 1e4]);

%%
clear; clc;
statRun = tic;
rng(20190101);
funcParam = evoFuncParams('evoFuncRosenbrock', 30, 5);
algoParam.algoMaxFEval = 4e5;
algoParam.algoIniX = zeros(30, 1);
algoParam.algoPopSize = 10;
algoParam.algoStopy = 1e-6;
optRes = evoDRES(funcParam, algoParam);
fprintf('Total runtime: %5.2e.\n', toc(statRun));
disp(evoCheckIsClose(evoFuncRosenbrock(optRes.optx), optRes.opty)); % 1
disp(optRes.opty); % 9.9868e-07
disp(optRes.ccFEval(1)); % 29
semilogy(optRes.ccFEval, 'm.'); xlim([0 2.4e6]); ylim([1e-6 1e2]);
xticks([0 4e5 8e5 1.2e6 1.6e6 2e6 2.4e6]);
