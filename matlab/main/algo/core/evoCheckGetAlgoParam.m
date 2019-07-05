function [maxFEval, iniSeed, stopy, stopt, outFEval, outFreq] = ...
    evoCheckGetAlgoParam(algoParam)
algoParam = evoCheckAlgoParam(algoParam);
maxFEval = algoParam.algoMaxFEval;
iniSeed = algoParam.algoIniSeed;
stopy = algoParam.algoStopy;
stopt = algoParam.algoStopt;
outFEval = algoParam.algoOutFEval;
outFreq = algoParam.algoOutFreq;
end
