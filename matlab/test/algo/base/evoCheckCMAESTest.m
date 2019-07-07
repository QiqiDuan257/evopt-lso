clear; clc;

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniSeed = 7;
algoParam.algoStopy = 20;
algoParam.algoStopt = 120;
algoParam.algoOutFEval = false;
algoParam.algoOutFreq = 100;
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX, outFile, stepSize, outCov] = ...
    evoCheckCMAES(algoParam, funcParam);
disp(maxFEval); % 2000
disp(iniSeed); % 7
disp(stopy); % 20
disp(stopt); % 120
disp(outFEval); % 0
disp(outFreq); % 100
disp(popSize); % 6
disp(iniX);
%    -1.4658
%     3.4594
disp(outFile); % evoCMAES_evoFuncSphere_D2
disp(stepSize); % 0.7
disp(outCov); % 0

%%
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoPopSize = 3;
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX] = evoCheckCMAES(algoParam, funcParam);
disp(maxFEval); % 100
disp(iniSeed); % 7
disp(stopy); % -Inf
disp(stopt); % 7200
disp(outFEval); % 1
disp(outFreq); % 1000
disp(popSize); % 3
disp(iniX);
%    -1.4658
%     3.4594

%% `algoPopSize` should be a positive integer.
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoPopSize = 0;
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
evoCheckCMAES(algoParam, funcParam);

%%
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoPopSize = 3;
algoParam.algoIniX = [1; 2];
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX] = evoCheckCMAES(algoParam, funcParam);
disp(maxFEval); % 100
disp(iniSeed); % 7
disp(stopy); % -Inf
disp(stopt); % 7200
disp(outFEval); % 1
disp(outFreq); % 1000
disp(popSize); % 3
disp(iniX);
%      1
%      2

%% `algoIniX` should be a 2 * 1 numeric vector.
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoPopSize = 3;
algoParam.algoIniX = [1 2 3]';
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
evoCheckCMAES(algoParam, funcParam);

%% `algoIniX` should not be out of upper search bound.
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoPopSize = 3;
algoParam.algoIniX = [5.5 1]';
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
evoCheckCMAES(algoParam, funcParam);

%% `algoIniX` should not be out of lower search bound.
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoPopSize = 3;
algoParam.algoIniX = [1 -2.5]';
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
evoCheckCMAES(algoParam, funcParam);

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniSeed = 7;
algoParam.algoStepSize = 1.1;
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX, outFile, stepSize, outCov] = ...
    evoCheckCMAES(algoParam, funcParam);
disp(maxFEval); % 2000
disp(iniSeed); % 7
disp(stopy); % -Inf
disp(stopt); % 7200
disp(outFEval); % 1
disp(outFreq); % 1000
disp(popSize); % 6
disp(size(iniX)); % 2 1
disp(outFile); % evoCMAES_evoFuncSphere_D2
disp(stepSize); % 1.1
disp(outCov); % 0

%% `algoStepSize` should be a float scalar.
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoStepSize = true;
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
evoCheckCMAES(algoParam, funcParam);

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniSeed = 7;
algoParam.algoOutCov = true;
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX, outFile, stepSize, outCov] = ...
    evoCheckCMAES(algoParam, funcParam);
disp(maxFEval); % 2000
disp(iniSeed); % 7
disp(stopy); % -Inf
disp(stopt); % 7200
disp(outFEval); % 1
disp(outFreq); % 1000
disp(popSize); % 6
disp(size(iniX)); % 2 1
disp(outFile); % evoCMAES_evoFuncSphere_D2
disp(stepSize); % 0.7
disp(outCov); % 1

%% `algoOutCov` should be a logical scalar.
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoOutCov = 1;
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
evoCheckCMAES(algoParam, funcParam);
