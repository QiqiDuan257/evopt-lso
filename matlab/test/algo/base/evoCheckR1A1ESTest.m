clear; clc;

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniSeed = 7;
algoParam.algoStopy = 20;
algoParam.algoStopt = 120;
funcParam = evoFuncParams('', 2, 5, -2);
[algoParam, maxFEval, stopy, stopt, iniX, stepSize, corXO] = ...
    evoCheckR1A1ES(algoParam, funcParam);
disp(maxFEval); % 2000
disp(stopy); % 20
disp(stopt); % 120
disp(size(iniX)); % 2 1
disp(stepSize); % 0.1
disp(corXO); % 0

%%
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
funcParam = evoFuncParams('', 2, 5, -2);
[algoParam, maxFEval, stopy, stopt, iniX, stepSize, corXO] = ...
    evoCheckR1A1ES(algoParam, funcParam);
disp(maxFEval); % 100
disp(stopy); % -Inf
disp(stopt); % 7200
disp(iniX);
%    -1.4658
%     3.4594
disp(stepSize); % 0.1
disp(corXO); % 0

%%
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoIniX = [1 2]';
funcParam = evoFuncParams('', 2, 5, -2);
[algoParam, maxFEval, stopy, stopt, iniX, stepSize, corXO] = ...
    evoCheckR1A1ES(algoParam, funcParam);
disp(maxFEval); % 100
disp(stopy); % -Inf
disp(stopt); % 7200
disp(iniX);
%      1
%      2
disp(stepSize); % 0.1
disp(corXO); % 0

%% `algoIniX` should be a 2 * 1 numeric vector.
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoIniX = [1 2 3]';
funcParam = evoFuncParams('', 2, 5, -2);
evoCheckR1A1ES(algoParam, funcParam);

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoStepSize = 20;
funcParam = evoFuncParams('', 2, 5, -2);
[algoParam, maxFEval, stopy, stopt, iniX, stepSize, corXO] = ...
    evoCheckR1A1ES(algoParam, funcParam);
disp(maxFEval); % 2000
disp(stopy); % -Inf
disp(stopt); % 7200
disp(size(iniX)); % 2 1
disp(stepSize); % 20
disp(corXO); % 0

%% `algoStepSize` should be a numeric scalar.
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoStepSize = true;
funcParam = evoFuncParams('', 2, 5, -2);
evoCheckR1A1ES(algoParam, funcParam);

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoCorXO = true;
funcParam = evoFuncParams('', 2, 5, -2);
[algoParam, maxFEval, stopy, stopt, iniX, stepSize, corXO] = ...
    evoCheckR1A1ES(algoParam, funcParam);
disp(maxFEval); % 2000
disp(stopy); % -Inf
disp(stopt); % 7200
disp(size(iniX)); % 2 1
disp(stepSize); % 0.1
disp(corXO); % 1

%% `algoCorXO` should be a logical scalar.
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoCorXO = 1;
funcParam = evoFuncParams('', 2, 5, -2);
evoCheckR1A1ES(algoParam, funcParam);
