clear; clc;

% nohup matlab -nodesktop -nodisplay -nosplash <evoHCCEAPASRun.m >evoHCCEAPASRun.out 2>&1 &

startRun = tic;
rng(20190101); % for reproducibility
funcParam.funcName = 'evoSF_Rosenbrock';
% funcParam.funcDims = [2 10];
algoParam.algoName = 'evoHCCEAPAS';
algoParam.algoCorXO = true;
[statOptRes, funcParams, algoParams] = ...
    evoCreateFAEBaseFunc(funcParam, algoParam);
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
