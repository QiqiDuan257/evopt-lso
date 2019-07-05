function optRes = evoRS(funcParam, algoParam)
% Random Search (RS).
%
% Input ->
%   funcParam : function parameters (struct)
%   algoParam : algorithm parameters (struct)
% Output <-
%   optRes    : optimization results (struct)
startRun = tic;
timeOutFEval = NaN; % runtime of outputting FEval curve
curveFEval = [];

% load `funcParam`
[funcParam, funcName, ~, funcUB, funcLB] = evoCheckGetFuncParam(funcParam);

% load `algoParam`
[maxFEval, ~, stopy, stopt, outFEval, outFreq, popSize, X, outFile] = ...
    evoCheckRS(algoParam, funcParam);

% set UB and LB for all individuals during search
funcUB = repmat(funcUB, 1, popSize);
funcLB = repmat(funcLB, 1, popSize);

% initialize fitness (i.e., y)
startFEval = tic;
y = feval(funcName, X);
timeFEval = toc(startFEval);
numFEval = size(X, 2);
if outFEval
    startOutFEval = tic;
    curveFEval = cat(1, curveFEval, y');
    timeOutFEval = toc(startOutFEval);
end

% initialize optx + opty
[opty, yMinInd] = min(y);
optx = X(:, yMinInd);

% iteratively optimize
stopFlag = 'maxFEval';
while numFEval < maxFEval
    if opty <= stopy
        stopFlag = 'stopy';
        break;
    end
    
    if toc(startRun) >= stopt
        stopFlag = 'stopt';
        break;
    end
    
    X = unifrnd(funcLB, funcUB);
    startFEval = tic;
    y = feval(funcName, X);
    timeFEval = timeFEval + toc(startFEval);
    numFEval = numFEval + size(X, 2);
    if outFEval
        startOutFEval = tic;
        curveFEval = cat(1, curveFEval, y');
        timeOutFEval = timeOutFEval + toc(startOutFEval);
    end
    
    % update optx + opty
    [yMin, yMinInd] = min(y);
    if opty > yMin
        opty = yMin;
        optx = X(:, yMinInd);
    end
end

% output FEval curve
if outFEval
    if isfield(algoParam, 'algoQuietOutFEval') && ...
            algoParam.algoQuietOutFEval
        % do not save `curveFEval` in the external file system
    else
        startOutFEval = tic;
        save(evoCreateFEvalFile(outFile), 'curveFEval');
        curveFEval = evoDecNumVect(curveFEval);
        outFreqVect = evoGetOutFreqVect(outFreq, numFEval);
        curveFEval = cat(2, outFreqVect, curveFEval(outFreqVect));
        timeOutFEval = timeOutFEval + toc(startOutFEval);
    end
end

% return optimization results
optRes.opty = opty;
optRes.optx = optx;
optRes.timeFEval = timeFEval;
optRes.numFEval = numFEval;
optRes.curveFEval = curveFEval;
optRes.timeOutFEval = timeOutFEval;
optRes.stopFlag = stopFlag;
optRes.funcParam = funcParam;
optRes.algoParam = algoParam;
optRes.runtime = toc(startRun);
end
