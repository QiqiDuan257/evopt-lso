clear; clc;

%%
clear; clc;
algoParam = {};
algoParam.algoMaxFEval = 10;
[algoParam, maxFEval, ~, stopy, stopt] = ...
    evoCheckGetAlgoParam(algoParam);
disp(algoParam);
%     algoMaxFEval: 10
%        algoStopy: -Inf
%        algoStopt: 7200
disp(maxFEval); % 10
disp(stopy); % -Inf
disp(stopt); % 7200

%%
clear; clc;
algoParam = {};
algoParam.algoMaxFEval = 2019;
algoParam.algoIniSeed = 579;
algoParam.algoStopy = 1e-10;
algoParam.algoStopt = 3600;
[algoParam, maxFEval, iniSeed, stopy, stopt] = ...
    evoCheckGetAlgoParam(algoParam);
disp(algoParam);
%     algoMaxFEval: 2019
%      algoIniSeed: 579
%        algoStopy: 1.0000e-10
%        algoStopt: 3600
disp(maxFEval); % 2019
disp(iniSeed); % 579
disp(stopy); % 1.0000e-10
disp(stopt); % 3600
