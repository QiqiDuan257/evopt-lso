function [statOptRes, funcParams, algoParams] = ...
    evoCreateFeaCECLSO2010(algoParam)
% Create a set of `FuncParam`, a set of `AlgoParam`, and
% an Environment for IEEE-CEC-LSO-2010.
startRun = tic;

funcParams = evoCreateFuncParamsCECLSO2010();
algoParams = evoCreateAlgoParamsCECLSO2010(funcParams, algoParam);
statOptRes = cell(length(funcParams), 1);

for f = 1 : length(funcParams)
    statOptRes{f} = evoCreateEnvCECLSO2010(funcParams{f}, algoParams{f});
end
save(sprintf('%s.mat', algoParam.algoName), ...
    'statOptRes', 'funcParams', 'algoParams', '-v7.3');
fprintf(sprintf('$$$-Runtime-$$$: %7.5e.\n', toc(startRun)));
end
