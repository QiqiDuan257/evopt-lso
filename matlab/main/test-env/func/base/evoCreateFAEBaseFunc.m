function [statOptRes, funcParams, algoParams] = ...
    evoCreateFAEBaseFunc(funcParam, algoParam)
% Create a set of `FuncParam`, a set of `AlgoParam`, and
% an Environment for the Base Function.
timeFEvalFile = 0;

funcParams = evoCreateFuncParamsBaseFunc(funcParam);
algoParams = evoCreateAlgoParamsBaseFunc(funcParams, algoParam);
statOptRes = cell(length(funcParams), 1);

for f = 1 : length(funcParams)
    statOptRes{f} = evoCreateEnvBaseFunc(funcParams{f}, algoParams{f});
    
    startFEvalFile = tic;
    ccFEvalFile = sprintf('%s_%s_D%d', algoParam.algoName, ...
        funcParam.funcName, funcParams{f}.funcDim);
    ccFEval = statOptRes{f}.ccFEval;
    save(evoCreateFEvalFile(ccFEvalFile), 'ccFEval');
    statOptRes{f}.ccFEval = evoZipFEvalFile(ccFEval, statOptRes{f}.numFEval);
    statOptRes{f}.algoParam = rmfield(statOptRes{f}.algoParam, 'algoIniX');
    timeFEvalFile = timeFEvalFile + toc(startFEvalFile);
end

save(algoParam.algoName, 'statOptRes', ...
    'funcParams', 'algoParams', 'timeFEvalFile', '-v7.3');
end
