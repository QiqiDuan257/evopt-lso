clear; clc;

% nohup matlab -nodesktop -nodisplay -nosplash <evoPCMAESRun.m >evoPCMAESRun.out 2>&1 &

startRun = tic;
rng(20190101); % for reproducibility
funcParam.funcName = 'evoL1_RF_Ellipsoid';
% funcParam.funcDims = [2 10];
algoParam.algoName = 'evoPCMAES';
algoParam.algoStopt = 3600 * 4;
[statOptRes, funcParams, algoParams] = ...
    evoCreateFAEBaseFunc(funcParam, algoParam);
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
