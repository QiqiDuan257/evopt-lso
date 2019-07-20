clear; clc;

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniSeed = 7;
algoParam.algoStopy = 20;
algoParam.algoStopt = 120;
funcParam = evoFuncParams('', 2, 5, -2);
[algoParam, maxFEval, stopy, stopt, iniX, ...
    stepSize, corXO, recStepSize, popSize, B, D, C, ...
    timeEig, numEig, numBDnotReal, numCisNI, recCov] = ...
    evoCheckPCMAES(algoParam, funcParam);
disp(maxFEval); % 2000
disp(stopy); % 20
disp(stopt); % 120
disp(size(iniX)); % 2 1
disp(stepSize); % 0.1
disp(corXO); % 0
disp(recStepSize); % 0
disp(popSize); % 6
disp(size(B)); % 2 2
disp(size(D)); % 2 1
disp(size(C)); % 2 2
disp(timeEig); % 0
disp(numEig); % 0
disp(numBDnotReal); % 0
disp(numCisNI); % 0
disp(recCov); % 0

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniX = [10 10]';
funcParam = evoFuncParams('', 2, 5, -2);
[algoParam, maxFEval, stopy, stopt, iniX, ...
    stepSize, corXO, recStepSize, popSize, B, D, C, ...
    timeEig, numEig, numBDnotReal, numCisNI, recCov] = ...
    evoCheckPCMAES(algoParam, funcParam);
disp(maxFEval); % 2000
disp(stopy); % -Inf
disp(stopt); % 7200
disp(size(iniX)); % 2 1
disp(stepSize); % 0.1
disp(corXO); % 0
disp(recStepSize); % 0
disp(popSize); % 6
disp(size(B)); % 2 2
disp(size(D)); % 2 1
disp(size(C)); % 2 2
disp(timeEig); % 0
disp(numEig); % 0
disp(numBDnotReal); % 0
disp(numCisNI); % 0
disp(recCov); % 0

%% `algoIniX` should not be out of upper search bound.
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoCorXO = true;
algoParam.algoIniX = [10 10]';
funcParam = evoFuncParams('', 2, 5, -2);
evoCheckPCMAES(algoParam, funcParam);

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniCov = [1+1i 1+2i; 1+3i 1+4i];
algoParam.algoRecCov = true;
funcParam = evoFuncParams('', 2, 5, -2);
[algoParam, maxFEval, stopy, stopt, iniX, ...
    stepSize, corXO, recStepSize, popSize, B, D, C, ...
    timeEig, numEig, numBDnotReal, numCisNI, recCov] = ...
    evoCheckPCMAES(algoParam, funcParam);
disp(maxFEval); % 2000
disp(stopy); % -Inf
disp(stopt); % 7200
disp(size(iniX)); % 2 1
disp(stepSize); % 0.1
disp(corXO); % 0
disp(recStepSize); % 0
disp(popSize); % 6
disp(size(B)); % 2 2
disp(size(D)); % 2 1
disp(size(C)); % 2 2
disp(numEig); % 1
disp(numBDnotReal); % 1
disp(numCisNI); % 0
disp(recCov); % 1

%% `algoParam.algoIniCov` should be a 2 * 2 numeric matrix.
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniCov = [1 2 3; 4 5 6];
funcParam = evoFuncParams('', 2, 5, -2);
evoCheckPCMAES(algoParam, funcParam);
