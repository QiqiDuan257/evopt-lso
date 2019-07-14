function [algoParam, maxFEval, iniSeed, stopy, stopt] = ...
    evoCheckGetAlgoParam(algoParam)
algoParam = evoCheckAlgoParam(algoParam);
maxFEval = algoParam.algoMaxFEval;
iniSeed = algoParam.algoIniSeed;
stopy = algoParam.algoStopy;
stopt = algoParam.algoStopt;
end
