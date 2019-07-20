function [algoParam, maxFEval, stopy, stopt, iniX, ...
    stepSize, corXO, recStepSize, popSize, B, D, C, ...
    timeEig, numEig, numBDnotReal, numCisNI, recCov] = ...
    evoCheckPCMAES(algoParam, funcParam)
% Check whether all the settings of `algoParam` are right for PCMAES.
[algoParam, maxFEval, iniSeed, stopy, stopt] = ...
    evoCheckGetAlgoParam(algoParam);

funcDim = funcParam.funcDim;
funcIniUB = funcParam.funcIniUB;
funcIniLB = funcParam.funcIniLB;

timeEig = 0; % time of eig
numEig = 0; % number of eig
numBDnotReal = 0; % number of B or D which are not real values
numCisNI = 0; % number of C which are NaN or Inf values

% algoCorXO
if ~isfield(algoParam, 'algoCorXO')
    algoParam.algoCorXO = false;
end
corXO = algoParam.algoCorXO;
if ~isscalar(corXO) || ~islogical(corXO)
    error('`algoCorXO` should be a logical scalar.');
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
if corXO
    if any(iniX > funcIniUB)
        error('`algoIniX` should not be out of upper search bound.');
    end
    if any(iniX < funcIniLB)
        error('`algoIniX` should not be out of lower search bound.');
    end
end

% algoStepSize
if ~isfield(algoParam, 'algoStepSize')
    algoParam.algoStepSize = 1e-1;
end
stepSize = algoParam.algoStepSize;
if ~isscalar(stepSize) || ~isnumeric(stepSize)
    error('`algoStepSize` should be a numeric scalar.');
end

% algoRecStepSize
if ~isfield(algoParam, 'algoRecStepSize')
    algoParam.algoRecStepSize = false;
end
recStepSize = algoParam.algoRecStepSize;
if ~isscalar(recStepSize) || ~islogical(recStepSize)
    error('`algoRecStepSize` should be a logical scalar.');
end

% algoPopSize
if ~isfield(algoParam, 'algoPopSize')
    algoParam.algoPopSize = 4 + floor(3 * log(funcDim));
end
popSize = algoParam.algoPopSize;
if ~evoCheckIsPosInt(popSize)
    error('`algoPopSize` should be a positive integer.');
end

% algoIniCov
if ~isfield(algoParam, 'algoIniCov')
    B = eye(funcDim, funcDim); % coordinate system
    D = ones(funcDim, 1); % scaling
    C = B * diag(D .^ 2) * B'; % covariance matrix
else
    C = algoParam.algoIniCov;
    if ~isnumeric(C) || any(size(C) ~= [funcDim funcDim])
        error('`algoIniCov` should be a %d * %d numeric matrix.', ...
            funcDim, funcDim);
    end
    if any(isnan(C(:))) || any(isinf(C(:)))
        numCisNI = 1;
        B = eye(funcDim, funcDim); % coordinate system
        D = ones(funcDim, 1); % scaling
        C = B * diag(D .^ 2) * B'; % covariance matrix
    else
        startEig = tic;
        [B, D] = eig(C);
        timeEig = toc(startEig);
        numEig = 1;
        
        if ~isreal(B) || ~isreal(D)
            numBDnotReal = 1;
            B = eye(funcDim, funcDim); % coordinate system
            D = ones(funcDim, 1); % scaling
            C = B * diag(D .^ 2) * B'; % covariance matrix
        else
            D = sqrt(diag(D)); % standard deviations
        end
    end
end

% algoRecCov
if ~isfield(algoParam, 'algoRecCov')
    algoParam.algoRecCov = false;
end
recCov = algoParam.algoRecCov;
if ~isscalar(recCov) || ~islogical(recCov)
    error('`algoRecCov` should be a logical scalar.');
end
end
