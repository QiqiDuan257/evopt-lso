clear; clc;

% nohup matlab -nodesktop -nodisplay -nosplash <evoR1A1ESRun.m >evoR1A1ESRun.out 2>&1 &

startRun = tic;
rng(20190101); % for reproducibility
funcParam.funcName = 'evoRF_Sphere';
% funcParam.funcDims = [2 10];
algoParam.algoName = 'evoR1A1ES';
algoParam.algoStopt = 3600 * 4;
[statOptRes, funcParams, algoParams] = ...
    evoCreateFAEBaseFunc(funcParam, algoParam);
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
