function [statOptRes, funcParams, algoParams] = ...
    evoCreateGsRsBFunc(funcParam, algoParam)
% Create a set of `FuncParam`, a set of `AlgoParam`, and
% a Grid Search Environment for Random Search on the Base Function.
timeFEvalFile = 0;

funcParams = evoCreateFuncParamsBaseFunc(funcParam);
algoParams = evoCreateAlgoParamsBaseFunc(funcParams, algoParam);
statOptRes = cell(length(funcParams), 1);

for f = 1 : length(funcParams)
    statOptRes{f} = evoCreateEnvBaseFunc(funcParams{f}, algoParams{f});
    
    startFEvalFile = tic;
    ccFEvalFile = sprintf('%s_%s_D%d_PS%d', algoParam.algoName, ...
        funcParam.funcName, funcParams{f}.funcDim, algoParam.algoPopSize);
    ccFEval = statOptRes{f}.ccFEval;
    save(evoCreateFEvalFile(ccFEvalFile), 'ccFEval');
    statOptRes{f}.ccFEval = evoZipCcFEval(ccFEval, statOptRes{f}.numFEval);
    statOptRes{f}.algoParam = rmfield(statOptRes{f}.algoParam, 'algoIniX');
    timeFEvalFile = timeFEvalFile + toc(startFEvalFile);
end

save(sprintf('%s_PS%d', algoParam.algoName, algoParam.algoPopSize), ...
    'statOptRes', 'funcParams', 'algoParams', 'timeFEvalFile', '-v7.3');
end
