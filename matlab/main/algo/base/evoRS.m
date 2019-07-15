function optRes = evoRS(funcParam, algoParam)
% Random Search (RS).
%
% Input ->
%   funcParam : function parameters (struct)
%   algoParam : algorithm parameters (struct)
% Output <-
%   optRes    : optimization results (struct)
startRun = tic; % start timing
ccFEval = []; % initialize convergence curve of function evaluations

% load `funcParam` + `algoParam`
[funcParam, funcName, ~, funcUB, funcLB] = evoCheckGetFuncParam(funcParam);
[algoParam, maxFEval, stopy, stopt, popSize, X] = evoCheckRS(...
    algoParam, funcParam);

% set UB and LB for all individuals during search
funcUB = repmat(funcUB, 1, popSize); % upper search bound
funcLB = repmat(funcLB, 1, popSize); % lower search bound

% initialize fitness (i.e., y)
startFEval = tic;
y = feval(funcName, X);
timeFEval = toc(startFEval);
numFEval = size(X, 2);

% update convergence curve of function evaluations
startCcFEval = tic;
ccFEval = cat(1, ccFEval, y');
timeCcFEval = toc(startCcFEval);

% initialize optx + opty
[opty, yMinInd] = min(y);
optx = X(:, yMinInd);

% iteratively optimize
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
    
    % generate uniformly distributed random samples (i.e., X)
    X = unifrnd(funcLB, funcUB);
    
    % evaluate these new samples (i.e., X) and get their fitness
    startFEval = tic;
    y = feval(funcName, X);
    timeFEval = timeFEval + toc(startFEval);
    numFEval = numFEval + size(X, 2);
    
    % update convergence curve of function evaluations
    startCcFEval = tic;
    ccFEval = cat(1, ccFEval, y');
    timeCcFEval = timeCcFEval + toc(startCcFEval);
    
    % update optx + opty
    [yMin, yMinInd] = min(y);
    if opty > yMin
        opty = yMin;
        optx = X(:, yMinInd);
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
optRes.runtime = toc(startRun); % end timing
end
