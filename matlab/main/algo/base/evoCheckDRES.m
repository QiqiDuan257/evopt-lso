function [algoParam, maxFEval, stopy, stopt, iniX, corXO, popSize] = ...
    evoCheckDRES(algoParam, funcParam)
% Check whether all the settings of `algoParam` are right for DRES.
[algoParam, maxFEval, iniSeed, stopy, stopt] = ...
    evoCheckGetAlgoParam(algoParam);

funcDim = funcParam.funcDim;
funcIniUB = funcParam.funcIniUB;
funcIniLB = funcParam.funcIniLB;

% algoIniX
if ~isfield(algoParam, 'algoIniX')
    rstream = RandStream('mt19937ar', 'Seed', iniSeed);
    algoParam.algoIniX = funcIniLB + (funcIniUB - funcIniLB) .* ...
        rand(rstream, funcDim, 1);
end
iniX = algoParam.algoIniX;
if ~isnumeric(iniX) || any(size(iniX) ~= [funcDim 1])
    error('`algoIniX` should be a %d * 1 numeric vector.', funcDim);
end

if any(iniX > funcIniUB)
    error('`algoIniX` should not be out of upper search bound.');
end
if any(iniX < funcIniLB)
    error('`algoIniX` should not be out of lower search bound.');
end

% algoCorXO
if ~isfield(algoParam, 'algoCorXO')
    algoParam.algoCorXO = false;
end
corXO = algoParam.algoCorXO;
if ~isscalar(corXO) || ~islogical(corXO)
    error('`algoCorXO` should be a logical scalar.');
end

% algoPopSize
if ~isfield(algoParam, 'algoPopSize')
    algoParam.algoPopSize = 4 + floor(3 * log(funcDim));
end
popSize = algoParam.algoPopSize;
if ~evoCheckIsPosInt(popSize)
    error('`algoPopSize` should be a positive integer.');
end
end
