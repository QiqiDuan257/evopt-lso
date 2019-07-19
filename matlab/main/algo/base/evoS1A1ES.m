function optRes = evoS1A1ES(funcParam, algoParam)
% Schwefel's (1+1)-Evolution Strategy (S1A1ES) with the 1/5 success rule.
%
% Input ->
%   funcParam : function parameters (struct)
%   algoParam : algorithm parameters (struct)
% Output <-
%   optRes    : optimization results (struct)
%
% Reference:
%   Back, T., Hoffmeister, F. and Schwefel, H.P., 1991, July.
%       A survey of evolution strategies. In Proceedings of the Fourth
%       International Conference on Genetic Algorithms (Vol. 2, No. 9).
%       Morgan Kaufmann Publishers, San Mateo, CA.
startRun = tic; % start timing
ccFEval = []; % initialize convergence curve of function evaluations

numXO = 0; % number of out-of-bound solutions
numCorXO = 0; % number of correcting out-of-bound solutions
timeCorXO = 0; % time of correcting out-of-bound solutions

% load `funcParam` + `algoParam`
[funcParam, funcName, funcDim, funcUB, funcLB] = ...
    evoCheckGetFuncParam(funcParam);
[algoParam, maxFEval, stopy, stopt, optx, ...
    stepSize, corXO, recStepSize] = evoCheckS1A1ES(algoParam, funcParam);

% initialize opty
startFEval = tic;
opty = feval(funcName, optx);
timeFEval = toc(startFEval);
numFEval = size(optx, 2);

% update convergence curve of function evaluations
startCcFEval = tic;
ccFEval = cat(1, ccFEval, opty);
timeCcFEval = toc(startCcFEval);

% initilize parameters for step-size adjustment
incStepSize = 1 / 0.82; % increase step-size
decStepSize = 0.82; % decrease step-size
numSucMut = 0; % number of successful mutations
ccStepSize = stepSize; % convergence curve of step-size
timeCcStepSize = 0;
if recStepSize % record the dynamic adjustment process of step-size
    startCcStepSize = tic;
    ccStepSize = [1 stepSize];
    timeCcStepSize = timeCcStepSize + toc(startCcStepSize);
end

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
    
    % adjust stepSize every `funcDim` mutations (via the 1/5 success rule)
    if (numFEval > 1) && ~rem(numFEval - 1, funcDim)
        if numSucMut > (1 / 5) * funcDim
            stepSize = incStepSize * stepSize;
        elseif numSucMut < (1 / 5) * funcDim
            stepSize = decStepSize * stepSize;
        end
        numSucMut = 0;
        if recStepSize
            startCcStepSize = tic;
            ccStepSize = cat(1, ccStepSize, [numFEval stepSize]);
            timeCcStepSize = timeCcStepSize + toc(startCcStepSize);
        end
    end
    
    % mutate the best-so-far solution (i.e., optx)
    x = optx + normrnd(zeros(funcDim, 1), stepSize);
    
    % check out-of-bound solutions
    startCorXO = tic;
    indXOB = (x > funcUB) | (x < funcLB);
    if any(indXOB)
        numXO = numXO + 1;
        if corXO % correct out-of-bound solutions
            x(indXOB) = unifrnd(funcLB(indXOB), funcUB(indXOB));
            numCorXO = numCorXO + 1;
        end
    end
    timeCorXO = timeCorXO + toc(startCorXO);
    
    % evaluate the new sample (i.e., x) and get its fitness
    startFEval = tic;
    y = feval(funcName, x);
    timeFEval = timeFEval + toc(startFEval);
    numFEval = numFEval + size(x, 2);
    
    % update convergence curve of function evaluations
    startCcFEval = tic;
    ccFEval = cat(1, ccFEval, y);
    timeCcFEval = timeCcFEval + toc(startCcFEval);
    
    % update optx + opty
    if opty > y
        opty = y;
        optx = x;
        numSucMut = numSucMut + 1;
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
optRes.runtime = toc(startRun); % end timing
end
