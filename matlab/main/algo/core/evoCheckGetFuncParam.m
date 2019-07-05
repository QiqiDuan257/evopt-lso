function [funcParam, funcName, funcDim, funcUB, funcLB, ...
    funcIniUB, funcIniLB] = evoCheckGetFuncParam(funcParam)
% Check and Get some basic settings of `funcParam`.
funcParam = evoCheckFuncParam(funcParam);
funcName = funcParam.funcName;
funcDim = funcParam.funcDim;
funcUB = funcParam.funcUB;
funcLB = funcParam.funcLB;
funcIniUB = funcParam.funcIniUB;
funcIniLB = funcParam.funcIniLB;
end
