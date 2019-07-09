function algoParams = evoCreateAlgoParamsBaseFunc(funcParams, algoParam)
% Create a set of `AlgoParam` for the Base Function.
baseAlgoParam = algoParam;

algoParams = cell(length(funcParams), 1);
for f = 1 : length(funcParams)
    algoParam = baseAlgoParam;
    algoParam.algoMaxFEval = 1e5 * funcParams{f}.funcDim;
    algoParam.algoIniSeed = 20190701 + funcParams{f}.funcDim;
    algoParam.algoStopy = 1e-10;
    algoParams{f} = algoParam;
end
end
