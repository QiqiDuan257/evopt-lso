clear; clc;

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniSeed = 7;
algoParam.algoStopy = 20;
algoParam.algoStopt = 120;
algoParam.algoOutFEval = false;
algoParam.algoOutFreq = 100;
funcParam.funcName = 'evoFuncSphere';
funcParam.funcDim = 2;
funcParam.funcIniUB = [5 5]';
funcParam.funcIniLB = [-2 -2]';
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX, outFile] = evoCheckRS(algoParam, funcParam);
disp(maxFEval); % 2000
disp(iniSeed); % 7
disp(stopy); % 20
disp(stopt); % 120
disp(outFEval); % 0
disp(outFreq); % 100
disp(popSize); % 1000
disp(size(iniX)); % 2 1000
disp(outFile); % evoRS_evoFuncSphere_D2

%%
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoPopSize = 3;
funcParam.funcDim = 2;
funcParam.funcIniUB = [5 5]';
funcParam.funcIniLB = [-2 -2]';
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX] = evoCheckRS(algoParam, funcParam);
disp(maxFEval); % 100
disp(iniSeed); % 7
disp(stopy); % -Inf
disp(stopt); % 7200
disp(outFEval); % 1
disp(outFreq); % 1000
disp(popSize); % 3
disp(iniX);
%    -1.4658    1.0689    4.8459
%     3.4594    3.0643    1.7695

%% `algoPopSize` should be a positive integer.
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoPopSize = 0;
funcParam.funcDim = 2;
funcParam.funcIniUB = [5 5]';
funcParam.funcIniLB = [-2 -2]';
evoCheckRS(algoParam, funcParam);

%%
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoPopSize = 3;
algoParam.algoIniX = [1 2 3; 1 2 3];
funcParam.funcDim = 2;
funcParam.funcIniUB = [5 5]';
funcParam.funcIniLB = [-2 -2]';
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX] = evoCheckRS(algoParam, funcParam);
disp(maxFEval); % 100
disp(iniSeed); % 7
disp(stopy); % -Inf
disp(stopt); % 7200
disp(outFEval); % 1
disp(outFreq); % 1000
disp(popSize); % 3
disp(iniX);
%      1     2     3
%      1     2     3

%% `algoIniX` should be a 2 * 3 numeric matrix.
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoPopSize = 3;
algoParam.algoIniX = [1 2 3];
funcParam.funcDim = 2;
funcParam.funcIniUB = [5 5]';
funcParam.funcIniLB = [-2 -2]';
evoCheckRS(algoParam, funcParam);

%% `algoIniX` should not be out of upper search bound.
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoPopSize = 3;
algoParam.algoIniX = [1 2 30; 1 2 3];
funcParam.funcDim = 2;
funcParam.funcIniUB = [5 5]';
funcParam.funcIniLB = [-2 -2]';
evoCheckRS(algoParam, funcParam);

%% `algoIniX` should not be out of lower search bound.
clear; clc;
algoParam.algoMaxFEval = 100;
algoParam.algoIniSeed = 7;
algoParam.algoPopSize = 3;
algoParam.algoIniX = [1 2 3; 1 2 -3];
funcParam.funcDim = 2;
funcParam.funcIniUB = [5 5]';
funcParam.funcIniLB = [-2 -2]';
evoCheckRS(algoParam, funcParam);

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoOutFile = 'FEval';
funcParam = evoFuncParams('evoFuncSphere', 2, 5, 2);
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX, outFile] = evoCheckRS(algoParam, funcParam);
disp(maxFEval); % 2000
disp(stopy); % -Inf
disp(stopt); % 7200
disp(outFEval); % 1
disp(outFreq); % 1000
disp(popSize); % 1000
disp(size(iniX)); % 2 1000
disp(outFile); % FEval

%% `algoOutFile` should be of char or string type.
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoOutFile = true;
funcParam = evoFuncParams('evoFuncSphere', 2, 5, 2);
evoCheckRS(algoParam, funcParam);
