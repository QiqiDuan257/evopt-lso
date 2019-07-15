function [algoParam, maxFEval, stopy, stopt, popSize, iniX] = ...
    evoCheckRS(algoParam, funcParam)
% Check whether all the settings of `algoParam` are right for RS.
[algoParam, maxFEval, iniSeed, stopy, stopt] = ...
    evoCheckGetAlgoParam(algoParam);

funcDim = funcParam.funcDim;
funcIniUB = funcParam.funcIniUB;
funcIniLB = funcParam.funcIniLB;

% algoPopSize
if ~isfield(algoParam, 'algoPopSize')
    algoParam.algoPopSize = 1000;
end
popSize = algoParam.algoPopSize;
if ~evoCheckIsPosInt(popSize)
    error('`algoPopSize` should be a positive integer.');
end

% algoIniX
if ~isfield(algoParam, 'algoIniX')
    rstream = RandStream('mt19937ar', 'Seed', iniSeed);
    algoParam.algoIniX = funcIniLB + (funcIniUB - funcIniLB) .* ...
        rand(rstream, funcDim, popSize);
end
iniX = algoParam.algoIniX;
if ~isnumeric(iniX) || any(size(iniX) ~= [funcDim popSize])
    error('`algoIniX` should be a %d * %d numeric matrix.', ...
        funcDim, popSize);
end
outIniUB = iniX > repmat(funcIniUB, 1, popSize);
outIniLB = iniX < repmat(funcIniLB, 1, popSize);
if any(outIniUB(:))
    error('`algoIniX` should not be out of upper search bound.');
end
if any(outIniLB(:))
    error('`algoIniX` should not be out of lower search bound.');
end
end
