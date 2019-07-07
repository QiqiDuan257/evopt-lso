function [maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX, outFile, stepSize, outCov] = ...
    evoCheckCMAES(algoParam, funcParam)
% Check whether all the settings of `algoParam` are right for CMAES.
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq] = ...
    evoCheckGetAlgoParam(algoParam);

[~, funcName, funcDim, funcUB, funcLB, funcIniUB, funcIniLB] = ...
    evoCheckGetFuncParam(funcParam);

% algoPopSize
if ~isfield(algoParam, 'algoPopSize')
    algoParam.algoPopSize = 4 + floor(3 * log(funcDim));
end
popSize = algoParam.algoPopSize;
if ~evoCheckIsPosInt(popSize)
    error('`algoPopSize` should be a positive integer.');
end

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

% outFile
if ~isfield(algoParam, 'algoOutFile')
    algoParam.algoOutFile = sprintf('evoCMAES_%s_D%d', funcName, funcDim);
end
outFile = algoParam.algoOutFile;
if ~ischar(outFile) && ~isstring(outFile)
    error('`algoOutFile` should be of char or string type.');
end

% algoStepSize
if ~isfield(algoParam, 'algoStepSize')
    algoParam.algoStepSize = 0.1 * min(funcUB - funcLB);
end
stepSize = algoParam.algoStepSize;
if ~isscalar(stepSize) || ~isfloat(stepSize)
    error('`algoStepSize` should be a float scalar.');
end

% algoOutCov
if ~isfield(algoParam, 'algoOutCov')
    algoParam.algoOutCov = false;
end
outCov = algoParam.algoOutCov;
if ~isscalar(outCov) || ~islogical(outCov)
    error('`algoOutCov` should be a logical scalar.');
end
end
