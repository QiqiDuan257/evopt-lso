clear; clc;

% nohup matlab -nodesktop -nodisplay -nosplash <evoDRESRun.m >evoDRESRun.out 2>&1 &

startRun = tic;
rng(20190101); % for reproducibility
funcParam.funcName = 'evoFuncRosenbrock';
% funcParam.funcDims = [2 10];
algoParam.algoName = 'evoDRES';
[statOptRes, funcParams, algoParams] = ...
    evoCreateFAEBaseFunc(funcParam, algoParam);
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
