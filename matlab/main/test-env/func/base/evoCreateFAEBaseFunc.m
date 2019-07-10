function [statOptRes, funcParams, algoParams] = ...
    evoCreateFAEBaseFunc(funcParam, algoParam)
% Create a set of `FuncParam`, a set of `AlgoParam`, and
% an Environment for the Base Function
funcParams = evoCreateFuncParamsBaseFunc(funcParam);
algoParams = evoCreateAlgoParamsBaseFunc(funcParams, algoParam);
statOptRes = cell(length(funcParams), 1);
for f = 1 : length(funcParams)
    statOptRes{f} = evoCreateEnvBaseFunc(funcParams{f}, algoParams{f});
end
save(algoParam.algoName, 'statOptRes', 'funcParams', 'algoParams', '-v7.3');
end
