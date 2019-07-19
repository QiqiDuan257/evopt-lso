function optRes = evoR1A1ES(funcParam, algoParam)
% Rechenberg's (1+1)-Evolution Strategy (R1A1ES).
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
[algoParam, maxFEval, stopy, stopt, optx, stepSize, corXO] = ...
    evoCheckR1A1ES(algoParam, funcParam);

% initialize opty
startFEval = tic;
opty = feval(funcName, optx);
timeFEval = toc(startFEval);
numFEval = size(optx, 2);

% update convergence curve of function evaluations
startCcFEval = tic;
ccFEval = cat(1, ccFEval, opty);
timeCcFEval = toc(startCcFEval);

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
optRes.runtime = toc(startRun); % end timing
end
