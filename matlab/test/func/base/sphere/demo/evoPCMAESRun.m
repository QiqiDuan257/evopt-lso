clear; clc;

% nohup matlab -nodesktop -nodisplay -nosplash <evoPCMAESRun.m >evoPCMAESRun.out 2>&1 &

startRun = tic;
rng(20190101); % for reproducibility
funcParam.funcName = 'evoFuncSphere';
% funcParam.funcDims = [2 10];
algoParam.algoName = 'evoPCMAES';
[statOptRes, funcParams, algoParams] = ...
    evoCreateFAEBaseFunc(funcParam, algoParam);
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
