function algoParams = evoCreateAlgoParamsCECLSO2010(funcParams, algoParam)
% Create a set of `AlgoParam` for IEEE-CEC-LSO-2010.
algoParams = cell(length(funcParams), 1);
algoParam.algoMaxFEval = 3e6; % default value for IEEE-CEC-LSO-2010
for a = 1 : length(algoParams)
    algoParams{a} = algoParam;
end
end
