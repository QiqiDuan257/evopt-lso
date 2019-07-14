clear; clc;

%%
clear; clc;
algoParam.algoMaxFEval = 2000;
algoParam.algoIniSeed = 7;
algoParam.algoStopy = 20;
algoParam.algoStopt = 120;
algoParam.algoOutFEval = false;
algoParam.algoOutFreq = 100;
algoParam.algoCorULB = true;
funcParam = evoFuncParams('evoFuncSphere', 2, 5, -2);
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX, outFile, stepSize, outCov, corULB] = ...
    evoCheckPCMAES(algoParam, funcParam);
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
disp(outFile); % evoPCMAES_evoFuncSphere_D2
disp(stepSize); % 0.7
disp(outCov); % 0
disp(corULB); % 1
