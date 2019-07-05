function [maxFEval, iniSeed, stopy, stopt, outFEval, outFreq, ...
    popSize, iniX, outFile] = evoCheckRS(algoParam, funcParam)
% Check whether all the settings of `algoParam` are right for RS.
[maxFEval, iniSeed, stopy, stopt, outFEval, outFreq] = ...
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
    error('`algoIniX` should be a %d * %d numeric matrix.', funcDim, popSize);
end
outUB = iniX > repmat(funcIniUB, 1, popSize);
outLB = iniX < repmat(funcIniLB, 1, popSize);
if any(outUB(:))
    error('`algoIniX` should not be out of upper search bound.');
end
if any(outLB(:))
    error('`algoIniX` should not be out of lower search bound.');
end

% outFile
if ~isfield(algoParam, 'algoOutFile')
    algoParam.algoOutFile = sprintf('evoRS_%s_D%d', ...
        funcParam.funcName, funcDim);
end
outFile = algoParam.algoOutFile;
if ~ischar(outFile) && ~isstring(outFile)
    error('`algoOutFile` should be of char or string type.');
end
end
