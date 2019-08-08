function optRes = evoDRES(funcParam, algoParam)
% Evolution Strategy with DeRandomized mutative step-size (DRES).
%
% Input ->
%   funcParam : function parameters (struct)
%   algoParam : algorithm parameters (struct)
% Output <-
%   optRes    : optimization results (struct)
%
% Reference:
%   Ostermeier, A., Gawelczyk, A. and Hansen, N., 1994.
%   A derandomized approach to self-adaptation of evolution strategies.
%   Evolutionary Computation, 2(4), pp.369-380.
startRun = tic; % start timing
ccFEval = []; % initialize convergence curve of function evaluations

numXO = 0; % number of out-of-bound solutions
numCorXO = 0; % number of correcting out-of-bound solutions
timeCorXO = 0; % time of correcting out-of-bound solutions

% load `funcParam` + `algoParam`
[funcParam, funcName, funcDim, funcUB, funcLB] = ...
    evoCheckGetFuncParam(funcParam);
[algoParam, maxFEval, stopy, stopt, X, corXO, popSize] = ...
    evoCheckDRES(algoParam, funcParam);

% initialize fitness (i.e., y) of all individuals
startFEval = tic;
y = feval(funcName, X);
timeFEval = toc(startFEval);
numFEval = size(X, 2);

% update convergence curve of function evaluations
startCcFEval = tic;
ccFEval = cat(1, ccFEval, y');
timeCcFEval = toc(startCcFEval);

% initialize optx + opty
[opty, yMInd] = min(y);
optx = X(:, yMInd);

% initialize step-size for all individuals
stepSize = ones(funcDim, 1);
globVar = Inf * ones(popSize, 1); % global step-size variation
normMut = Inf * ones(funcDim, popSize); % normally distributed mutation

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
    
    % mutate the best-so-far solution (i.e., optx)
    for k = 1 : popSize
        if rand(1) > 1 / 2
            globVar(k) = 1.4;
        else
            globVar(k) = 1 / 1.4;
        end
        normMut(:, k) = normrnd(zeros(funcDim, 1), 1);
        X(:, k) = optx + globVar(k) * stepSize .* normMut(:, k);
        
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
    
    % evaluate the new samples (i.e., X) and get its fitness
    startFEval = tic;
    y = feval(funcName, X);
    timeFEval = timeFEval + toc(startFEval);
    numFEval = numFEval + size(X, 2);
    
    % update convergence curve of function evaluations
    startCcFEval = tic;
    ccFEval = cat(1, ccFEval, y');
    timeCcFEval = timeCcFEval + toc(startCcFEval);
    
    % update optx + opty
    [yMin, yMInd] = min(y);
    if opty > yMin
        opty = yMin;
        optx = X(:, yMInd);
    end
    
    % update step-size
    stepSize = (globVar(yMInd) ^ sqrt(1 / funcDim)) * ...
        (exp(abs(normMut(:, yMInd)) - sqrt(2 / 3.14)) .^ (1 / funcDim)) .* ...
        stepSize;
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
optRes.runtime = toc(startRun); % end timing
end
