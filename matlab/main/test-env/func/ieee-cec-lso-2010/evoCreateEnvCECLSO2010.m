function optRes = evoCreateEnvCECLSO2010(funcParam, algoParam)
% Create an Environment for IEEE-CEC-LSO-2010.
%
% Inputs ->
%   funcParam : function parameters (struct)
%   algoParam : algorithm parameters (struct)
% Outputs <-
%   optRes    : optimization results (cell)
global initial_flag;

expeNum = 25; % default value for IEEE-CEC-LSO-2010

funcName = funcParam.funcName;
algoName = algoParam.algoName;

fprintf(sprintf('** funcName: %s + algoName: %s **\n', ...
    funcName, algoName));
logInfo = ['    %02d: opty = %+7.4e | runtime = %7.2e ' ...
    '| timeFEval = %7.2e | numFEval = %d <- '...
    'optx [%+7.2e ... %+7.2e]\n'];

optRes = cell(expeNum, 1);
opty = Inf * ones(expeNum, 1);
runtime = Inf * ones(expeNum, 1);
timeFEval = Inf * ones(expeNum, 1);
numFEval = Inf * ones(expeNum, 1);
for e = 1 : expeNum
    initial_flag = 0;
    algoParam.algoIniSeed = 1e7 * e + sum(double(funcName));
    optRes{e} = feval(algoName, funcParam, algoParam);
    opty(e) = optRes{e}.opty;
    runtime(e) = optRes{e}.runtime;
    timeFEval(e) = optRes{e}.timeFEval;
    numFEval(e) = optRes{e}.numFEval;
    fprintf(logInfo, e, opty(e), runtime(e), ...
        timeFEval(e), numFEval(e), ...
        optRes{e}.optx(1), optRes{e}.optx(end));
    
    startFEvalFile = tic;
    ccFEvalFile = sprintf('%s_%s_%02d', algoName, funcName, e);
    ccFEval = optRes{e}.ccFEval;
    save(evoCreateFEvalFile(ccFEvalFile), 'ccFEval');
    optRes{e}.ccFEval = evoZipCcFEval(ccFEval, optRes{e}.numFEval);
    optRes{e}.algoParam = rmfield(optRes{e}.algoParam, 'algoIniX');
    optRes{e}.timeFEvalFile = toc(startFEvalFile);
end

fprintf('$$ ------- >>> Summary <<< ------- $$:\n');
ratioFEval = 100 * (timeFEval ./ runtime);
fprintf(sprintf('** funcName: %s + algoName: %s **\n', ...
    funcName, algoName));
fprintf('    -> opty       - Mean & Std: %7.2e & %7.2e\n', ...
    mean(opty), std(opty));
fprintf('    -> runtime    - Mean & Std: %7.2e & %7.2e\n', ...
    mean(runtime), std(runtime));
fprintf('    -> timeFEval  - Mean & Std: %7.2e & %7.2e\n', ...
    mean(timeFEval), std(timeFEval));
fprintf('    -> ratioFEval - Mean & Std: %7.2f%% & %7.2f%%\n', ...
    mean(ratioFEval), std(ratioFEval));
fprintf('    -> numFEval   - Mean & Std: %7.2e & %7.2e\n', ...
    mean(numFEval), std(numFEval));
end
