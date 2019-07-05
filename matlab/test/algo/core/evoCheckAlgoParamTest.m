clear; clc;

%% `algoMaxFEval` should be a field of `algoParam`.
clear; clc;
evoCheckAlgoParam({});

%% `algoMaxFEval` should be a positive integer.
clear; clc;
algoParam.algoMaxFEval = 0;
evoCheckAlgoParam(algoParam);

%%
clear; clc;
algoParam.algoMaxFEval = 1e7;
algoParam.algoIniSeed = 0;
disp(evoCheckAlgoParam(algoParam));
%     algoMaxFEval: 10000000
%      algoIniSeed: 0
%        algoStopy: -Inf
%        algoStopt: 7200
%     algoOutFEval: 1
%      algoOutFreq: 1000

%% `algoIniSeed` should be a nonnegative integer.
clear; clc;
algoParam.algoMaxFEval = 1e7;
algoParam.algoIniSeed = -1;
evoCheckAlgoParam(algoParam);

%%
clear; clc;
algoParam.algoMaxFEval = 7;
algoParam.algoIniSeed = 1;
algoParam.algoStopy = -100;
disp(evoCheckAlgoParam(algoParam));
%     algoMaxFEval: 7
%      algoIniSeed: 1
%        algoStopy: -100
%        algoStopt: 7200
%     algoOutFEval: 1
%      algoOutFreq: 1000

%% `algoStopy` should be a non-nan numeric scalar.
clear; clc;
algoParam.algoMaxFEval = 7;
algoParam.algoStopy = nan;
disp(evoCheckAlgoParam(algoParam));

%%
clear; clc;
algoParam.algoMaxFEval = 7;
algoParam.algoIniSeed = 1;
algoParam.algoStopt = 3600;
disp(evoCheckAlgoParam(algoParam));
%     algoMaxFEval: 7
%      algoIniSeed: 1
%        algoStopt: 3600
%        algoStopy: -Inf
%     algoOutFEval: 1
%      algoOutFreq: 1000

%% `algoStopt` should be a non-nan numeric scalar.
clear; clc;
algoParam.algoMaxFEval = 7;
algoParam.algoStopt = nan;
disp(evoCheckAlgoParam(algoParam));

%%
clear; clc;
algoParam.algoMaxFEval = 7;
algoParam.algoIniSeed = 1;
algoParam.algoOutFEval = false;
disp(evoCheckAlgoParam(algoParam));
%     algoMaxFEval: 7
%      algoIniSeed: 1
%     algoOutFEval: 0
%        algoStopy: -Inf
%        algoStopt: 7200
%      algoOutFreq: 1000

%% `algoOutFEval` should be a logical scalar.
clear; clc;
algoParam.algoMaxFEval = 7;
algoParam.algoOutFEval = 1;
disp(evoCheckAlgoParam(algoParam));

%%
clear; clc;
algoParam.algoMaxFEval = 7;
algoParam.algoIniSeed = 1;
algoParam.algoOutFreq = 10;
disp(evoCheckAlgoParam(algoParam));
%     algoMaxFEval: 7
%      algoIniSeed: 1
%      algoOutFreq: 10
%        algoStopy: -Inf
%        algoStopt: 7200
%     algoOutFEval: 1

%% `algoOutFreq` should be a positive integer.
clear; clc;
algoParam.algoMaxFEval = 7;
algoParam.algoOutFreq = true;
disp(evoCheckAlgoParam(algoParam));

%% `algoOutFreq` should be a positive integer.
clear; clc;
algoParam.algoMaxFEval = 7;
algoParam.algoOutFreq = -1;
disp(evoCheckAlgoParam(algoParam));

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniSeed = 7;
algoParam.algoStopy = 20;
algoParam.algoStopt = 120;
algoParam.algoOutFEval = false;
algoParam.algoOutFreq = 100;
disp(evoCheckAlgoParam(algoParam));
%     algoMaxFEval: 2000
%      algoIniSeed: 7
%        algoStopy: 20
%        algoStopt: 120
%     algoOutFEval: 0
%      algoOutFreq: 100
