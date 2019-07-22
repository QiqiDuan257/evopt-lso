function funcParam = evoDiCoCyclicRand(funcParam)
% Cyclic + Random Decomposition.
%
% Input ->
%   funcParam: function parameters (struct)
%       => funcNumPart - number of partitions (int scalar)
%       -> funcDimSet - dimension indexes set (column vector)
% Output <-
%   funcParam: function parameters (struct)
%       +> funcPartSet - partition set of the dimension indexes (cell)
%
% Reference:
%   Yang, Z., Tang, K. and Yao, X., 2008.
%   Large scale evolutionary optimization using cooperative coevolution.
%   Information Sciences, 178(15), pp.2985-2999.
if ~isfield(funcParam, 'funcDim')
    error('`funcDim` should be a field of `funcParam`.');
else
    if ~evoCheckIsPosInt(funcParam.funcDim)
        error('`funcDim` should be a positive integer.');
    end
end
funcDim = funcParam.funcDim;

if ~isfield(funcParam, 'funcNumPart')
    error('`funcNumPart` should be a field of `funcParam`.');
else
    if ~evoCheckIsPosInt(funcParam.funcNumPart)
        error('`funcNumPart` should be a positive integer.');
    end
end
funcNumPart = min(funcParam.funcNumPart, funcDim);

if ~isfield(funcParam, 'funcDimSet')
    funcDimSet = randperm(funcDim)';
else
    funcDimSet = funcParam.funcDimSet;
    if ~evoCheckIsColPosIntVect(funcDimSet) || ...
            (numel(funcDimSet) ~= funcDim)
        error('`funcDimSet` should be a %d * 1 integer vector.', funcDim);
    end
    funcDimSet = funcDimSet(randperm(numel(funcDimSet)));
end

funcPartSet = cell(funcNumPart, 1);
for d = 1 : numel(funcDimSet)
    ind = rem(d, funcNumPart);
    if ind == 0
        ind = funcNumPart;
    end
    funcPartSet{ind} = cat(1, funcPartSet{ind}, funcDimSet(d));
end

for p = 1 : length(funcPartSet)
    funcPartSet{p} = sort(funcPartSet{p});
end
funcParam.funcPartSet = funcPartSet;
funcParam.funcNumFEval = 0;
end
