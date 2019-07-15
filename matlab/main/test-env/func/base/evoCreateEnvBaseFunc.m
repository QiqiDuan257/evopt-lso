function optRes = evoCreateEnvBaseFunc(funcParam, algoParam)
% Create an Environment for the Base Function with running the algorithm once.
%
% Inputs ->
%   funcParam : function parameters (struct)
%   algoParam : algorithm parameters (struct)
% Outputs <-
%   optRes    : optimization results (struct)

% load `funcParam`
funcParam = evoCheckFuncParam(funcParam);

% load `algoParam`
algoName = algoParam.algoName;
maxFEval = algoParam.algoMaxFEval;

% optimize
fprintf('*** funcDim: %d + algoName: %s + maxFEval: %d ***\n', ...
    funcParam.funcDim, algoName, maxFEval);
optRes = feval(algoName, funcParam, algoParam);
logInfo = ['    opty = %+7.4e | runtime = %7.2e ' ...
    '| timeFEval = %7.2e | numFEval = %d '...
    '| timeCcFEval = %7.2e | stopFlag = %s\n'];
fprintf(logInfo, optRes.opty, optRes.runtime, ...
    optRes.timeFEval, optRes.numFEval, ...
    optRes.timeCcFEval, optRes.stopFlag);
end
