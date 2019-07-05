function funcParam = evoCheckFuncParam(funcParam)
% Check whether some basic settings of `funcParam` are right.

% funcName
if ~isfield(funcParam, 'funcName')
    error('`funcName` should be a field of `funcParam`.');
end
if ~evoCheckIsFuncName(funcParam.funcName)
    error('`funcName` should be of `char`, `string`, or `function_handle` type.');
end

% funcDim
if ~isfield(funcParam, 'funcDim')
    error('`funcDim` should be a field of `funcParam`.');
end
if ~evoCheckIsPosInt(funcParam.funcDim)
    error('`funcDim` should be a positive integer.');
end

% funcUB + funcLB + funcIniUB + funcIniLB
if ~isfield(funcParam, 'funcUB')
    error('`funcUB` should be a field of `funcParam`.');
end
if ~isfield(funcParam, 'funcLB')
    error('`funcLB` should be a field of `funcParam`.');
end
if ~isfield(funcParam, 'funcIniUB')
    funcParam.funcIniUB = funcParam.funcUB;
end
if ~isfield(funcParam, 'funcIniLB')
    funcParam.funcIniLB = funcParam.funcLB;
end
evoCheckFuncULB(funcParam.funcDim, ...
    funcParam.funcUB, funcParam.funcLB, ...
    funcParam.funcIniUB, funcParam.funcIniLB);
end
