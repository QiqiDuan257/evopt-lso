function [algoParam, maxFEval, stopy, stopt, iniX, ...
    stepSize, corXO, recStepSize] = evoCheckS1A1ES(algoParam, funcParam)
% Check whether all the settings of `algoParam` are right for S1A1ES.
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

% algoStepSize
if ~isfield(algoParam, 'algoStepSize')
    algoParam.algoStepSize = 1e-1;
end
stepSize = algoParam.algoStepSize;
if ~isscalar(stepSize) || ~isnumeric(stepSize)
    error('`algoStepSize` should be a numeric scalar.');
end

% algoCorXO
if ~isfield(algoParam, 'algoCorXO')
    algoParam.algoCorXO = false;
end
corXO = algoParam.algoCorXO;
if ~isscalar(corXO) || ~islogical(corXO)
    error('`algoCorXO` should be a logical scalar.');
end

% algoRecStepSize
if ~isfield(algoParam, 'algoRecStepSize')
    algoParam.algoRecStepSize = false;
end
recStepSize = algoParam.algoRecStepSize;
if ~isscalar(recStepSize) || ~islogical(recStepSize)
    error('`algoRecStepSize` should be a logical scalar.');
end
end
