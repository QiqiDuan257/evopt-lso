clear; clc;

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniSeed = 7;
algoParam.algoStopy = 20;
algoParam.algoStopt = 120;
funcParam = evoFuncParams('', 2, 5, -2);
[algoParam, maxFEval, stopy, stopt, iniX, ...
    stepSize, corXO, recStepSize] = evoCheckS1A1ES(algoParam, funcParam);
disp(maxFEval); % 2000
disp(stopy); % 20
disp(stopt); % 120
disp(size(iniX)); % 2 1
disp(stepSize); % 0.1
disp(corXO); % 0
disp(recStepSize); % 0

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoRecStepSize = true;
funcParam = evoFuncParams('', 2, 5, -2);
[algoParam, maxFEval, stopy, stopt, iniX, ...
    stepSize, corXO, recStepSize] = evoCheckS1A1ES(algoParam, funcParam);
disp(maxFEval); % 2000
disp(stopy); % -Inf
disp(stopt); % 7200
disp(size(iniX)); % 2 1
disp(stepSize); % 0.1
disp(corXO); % 0
disp(recStepSize); % 1

%% `algoRecStepSize` should be a logical scalar.
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoRecStepSize = 1;
funcParam = evoFuncParams('', 2, 5, -2);
evoCheckS1A1ES(algoParam, funcParam);
