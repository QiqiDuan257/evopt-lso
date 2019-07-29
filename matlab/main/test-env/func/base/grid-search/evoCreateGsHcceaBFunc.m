function [statOptRes, funcParams, algoParams] = ...
    evoCreateGsHcceaBFunc(funcParam, algoParam)
% Create a set of `FuncParam`, a set of `AlgoParam`, and
% a Grid Search environment for HCCEA on the Base Function.
timeFEvalFile = 0;

funcParams = evoCreateFuncParamsGsHcceaBFunc(funcParam);
algoParams = evoCreateAlgoParamsBaseFunc(funcParams, algoParam);
statOptRes = cell(length(funcParams), 1);

for f = 1 : length(funcParams)
    statOptRes{f} = evoCreateEnvBaseFunc(funcParams{f}, algoParams{f});
    
    startFEvalFile = tic;
    ccFEvalFile = sprintf('%s_%s_D%d_NP%d', ...
        algoParam.algoName, funcParam.funcName, ...
        funcParams{f}.funcDim, funcParams{f}.funcNumPart);
    ccFEval = statOptRes{f}.ccFEval;
    save(evoCreateFEvalFile(ccFEvalFile), 'ccFEval');
    statOptRes{f}.ccFEval = evoZipCcFEval(ccFEval, statOptRes{f}.numFEval);
    statOptRes{f}.algoParam = rmfield(statOptRes{f}.algoParam, 'algoIniX');
    timeFEvalFile = timeFEvalFile + toc(startFEvalFile);
end

save(sprintf('%s_NP%d', algoParam.algoName, funcParam.funcNumPart), ...
    'statOptRes', 'funcParams', 'algoParams', 'timeFEvalFile', '-v7.3');
end
