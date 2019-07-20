function optRes = evoPCMAES(funcParam, algoParam)
% *Pure* Covariance Matrix Adaptation Evolution Strategy (P-CMA-ES).
%
% Input ->
%   funcParam : function parameters (struct)
%   algoParam : algorithm parameters (struct)
% Output <-
%   optRes    : optimization results (struct)
%
% Reference: (*$* one of the most wonderful work in the EC field *$*)
%   http://cma.gforge.inria.fr/purecmaes.m
%   http://www.cmap.polytechnique.fr/~nikolaus.hansen/
startRun = tic; % start timing
ccFEval = []; % initialize convergence curve of function evaluations

numXO = 0; % number of out-of-bound solutions
numCorXO = 0; % number of correcting out-of-bound solutions
timeCorXO = 0; % time of correcting out-of-bound solutions

% load `funcParam` + `algoParam`
[funcParam, funcName, funcDim, funcUB, funcLB] = ...
    evoCheckGetFuncParam(funcParam);
[algoParam, maxFEval, stopy, stopt, optx, ...
    stepSize, corXO, recStepSize, popSize, B, D, C, ...
    timeEig, numEig, numBDnotReal, numCisNI, recCov] = ...
    evoCheckPCMAES(algoParam, funcParam);

% initialize opty
startFEval = tic;
opty = feval(funcName, optx);
timeFEval = toc(startFEval);
numFEval = size(optx, 2);

% update convergence curve of function evaluations
startCcFEval = tic;
ccFEval = cat(1, ccFEval, opty);
timeCcFEval = toc(startCcFEval);

% initialize convergence curve of step-size
ccStepSize = stepSize; % convergence curve of step-size
timeCcStepSize = 0;
if recStepSize % record the dynamic adjustment process of step-size
    startCcStepSize = tic;
    ccStepSize = [1 stepSize];
    timeCcStepSize = timeCcStepSize + toc(startCcStepSize);
end

% strategy parameter setting for Selection
mu = popSize / 2; % number of parents for recombination
weights = log(mu + 1 / 2) - log(1 : mu)'; % recombination weights
mu = floor(mu);
weights = weights / sum(weights); % normalized recombination weights
mueff = sum(weights) ^ 2 / sum(weights .^ 2);

% strategy parameter setting for Adaptation
% for cumulation for covariance matrix
cc = (4 + mueff / funcDim) / (funcDim + 4 + 2 * mueff / funcDim);
cs = (mueff + 2) / (funcDim + mueff + 5);  % for cumulation for stepSize
c1 = 2 / ((funcDim + 1.3) ^ 2 + mueff); % for rank-one update
% for rank-mu update
cmu = min(1 - c1, 2 * (mueff - 2 + 1 / mueff) / ((funcDim + 2) ^ 2 + mueff));
% damping for stepSize
damps = 1 + 2 * max(0, sqrt((mueff - 1) / (funcDim + 1)) - 1) + cs;

% initialize dynamic strategy parameters
pc = zeros(funcDim, 1); % evolution path for covariance matrix
ps = zeros(funcDim, 1); % evolution path for stepSize

invsqrtC = B * diag(D .^ -1) * B';
eigenEval = 0; % track update of B and D
chiFuncDim = funcDim ^ 0.5 * (1 - 1 / (4 * funcDim) + 1 / (21 * funcDim ^ 2));

% iteratively optimize
xMean = optx;
X = Inf * ones(funcDim, popSize);
stopFlag = 'maxFEval';
while numFEval < maxFEval
    % stop after reaching the threshold for the best-fo-far function value
    if opty <= stopy
        stopFlag = 'stopy';
        break;
    end
    
    % stop after reaching the threshold for the maximal allowable runtime
    if toc(startRun) >= stopt
        stopFlag = 'stopt';
        break;
    end
    
    for k = 1 : popSize
        X(:, k) = xMean + stepSize * B * (D .* randn(funcDim, 1));
        
        % check out-of-bound solutions
        startCorXO = tic;
        indXOB = (X(:, k) > funcUB) | (X(:, k) < funcLB);
        if any(indXOB)
            numXO = numXO + 1;
            if corXO % correct out-of-bound solutions
                X(indXOB, k) = unifrnd(funcLB(indXOB), funcUB(indXOB));
                numCorXO = numCorXO + 1;
            end
        end
        timeCorXO = timeCorXO + toc(startCorXO);
    end
    
    startFEval = tic;
    y = feval(funcName, X);
    timeFEval = timeFEval + toc(startFEval);
    numFEval = numFEval + size(X, 2);
    
    % update convergence curve of function evaluations
    startCcFEval = tic;
    ccFEval = cat(1, ccFEval, y');
    timeCcFEval = timeCcFEval + toc(startCcFEval);
    
    % sort and compute weighted mean
    [y, ySortInd] = sort(y);
    if opty > y(1) % update optx + opty
        opty = y(1);
        optx = X(:, ySortInd(1));
    end
    xMeanOld = xMean;
    xMean = X(:, ySortInd(1 : mu)) * weights; % weighted recombination
    
    % update evolution paths (cumulation)
    ps = (1 - cs) * ps + ...
        sqrt(cs * (2 - cs) * mueff) * invsqrtC * (xMean - xMeanOld) / stepSize;
    hsig = sum(ps .^ 2) / (1 - (1 - cs) ^ (2 * numFEval / popSize)) / funcDim < ...
        2 + 4 / (funcDim + 1);
    pc = (1 - cc) * pc + ...
        hsig * sqrt(cc * (2 - cc) * mueff) * (xMean - xMeanOld) / stepSize;
    
    % adapt covariance matrix
    muDiff = (1 / stepSize) * (X(:, ySortInd(1 : mu)) - ...
        repmat(xMeanOld, 1, mu)); % mu difference vectors
    C = (1 - c1 - cmu) * C + ...
        c1 * (pc * pc' + (1 - hsig) * cc * (2 - cc) * C) + ... % rank-one update
        cmu * muDiff * diag(weights) * muDiff'; % rank-mu update
    
    % adapt step size
    stepSize = stepSize * exp((cs / damps) * (norm(ps) / chiFuncDim - 1));
    if (numFEval > 1) && recStepSize
        startCcStepSize = tic;
        ccStepSize = cat(1, ccStepSize, [numFEval stepSize]);
        timeCcStepSize = timeCcStepSize + toc(startCcStepSize);
    end
    
    % update B and D from C -> to achieve O(funcDim ^ 2)
    if numFEval - eigenEval > popSize / (c1 + cmu) / funcDim / 10
        eigenEval = numFEval;
        C = triu(C) + triu(C, 1)'; % enforce symmetry
        if any(isnan(C(:))) || any(isinf(C(:)))
            numCisNI = numCisNI + 1;
            stopFlag = 'stopC';
            break;
        end
        startEig = tic;
        [B, D] = eig(C); % eigen decomposition
        timeEig = timeEig + toc(startEig);
        numEig = numEig + 1;
        if ~isreal(B) || ~isreal(D)
            numBDnotReal = numBDnotReal + 1;
            stopFlag = 'stopBD';
            break;
        end
        D = sqrt(diag(D)); % standard deviations
        invsqrtC = B * diag(D .^ -1) * B';
    end
    
    if max(D) > 1e7 * min(D)
        stopFlag = 'stopD';
        break;
    end
end

% return optimization results (optRes)
optRes.opty = opty;
optRes.optx = optx;
optRes.timeFEval = timeFEval;
optRes.numFEval = numFEval;
optRes.ccFEval = ccFEval;
optRes.timeCcFEval = timeCcFEval;
optRes.funcParam = funcParam;
optRes.algoParam = algoParam;
optRes.stopFlag = stopFlag;
optRes.numXO = numXO;
optRes.numCorXO = numCorXO;
optRes.timeCorXO = timeCorXO;
optRes.stepSize = stepSize;
optRes.ccStepSize= ccStepSize;
optRes.timeCcStepSize = timeCcStepSize;
optRes.timeEig = timeEig;
optRes.numEig = numEig;
optRes.numBDnotReal = numBDnotReal;
optRes.numCisNI = numCisNI;
if recCov
    optRes.FinC = C;
    optRes.FinB = B;
    optRes.FinD = D;
else
    optRes.FinC = NaN;
    optRes.FinB = NaN;
    optRes.FinD = NaN;
end
optRes.runtime = toc(startRun); % end timing
end
