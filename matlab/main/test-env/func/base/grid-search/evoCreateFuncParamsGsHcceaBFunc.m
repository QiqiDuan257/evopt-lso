function funcParams = evoCreateFuncParamsGsHcceaBFunc(funcParam)
% Create a set of `FuncParam` for the Grid Search for the partition
% number of HCCEA on the Base Function.
if ~isfield(funcParam, 'funcDims')
    funcDims = [2 1e1 1e2 1e3 2e3 4e3 6e3 8e3 1e4];
else
    funcDims = funcParam.funcDims;
end

funcDims = funcDims(funcParam.funcNumPart <= funcDims);

if ~isfield(funcParam, 'funcUB')
    funcUB = 100;
else
    funcUB = funcParam.funcUB;
end

funcParams = cell(length(funcDims), 1);
for d = 1 : length(funcDims)
    funcParams{d} = evoFuncParams(funcParam.funcName, funcDims(d), funcUB);
    funcParams{d}.funcNumPart = funcParam.funcNumPart;
end
end
