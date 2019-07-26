function funcParam = evoDiCoGDG(funcParam)
% Global Differential Grouping (GDG).
%
% Input ->
%   funcParam: function parameters (struct)
% Output <-
%   funcParam: function parameters (struct)
%       +> funcPartSet - partition set of the dimension indexes (cell)
%       +> funcNumFEval - number of function evaluations (int scalar)
%
% Reference:
%   Mei, Y., Omidvar, M.N., Li, X. and Yao, X., 2016.
%   A competitive divide-and-conquer algorithm for
%   unconstrained large-scale black-box optimization.
%   ACM Transactions on Mathematical Software (TOMS), 42(2), pp.13-24.
[funcParam, funcName, funcDim, funcUB, funcLB] = ...
    evoCheckGetFuncParam(funcParam);

% set the partition threshold via randomly sampling
if ~isfield(funcParam, 'funcPartThreshold')
    funcParam.funcPartThreshold = 1e-10;
end
threshold = funcParam.funcPartThreshold;
if ~isfield(funcParam, 'funcPartNumSamples')
    funcParam.funcPartNumSamples = 10; % number of samples
end
numSamples = funcParam.funcPartNumSamples;
X = unifrnd(repmat(funcLB, 1, numSamples), repmat(funcUB, 1, numSamples));
y = feval(funcName, X);
numFEval = size(X, 2);
threshold = min(abs(y)) * threshold;

% generate an interaction matrix according to the partition threshold
intMat = zeros(funcDim, funcDim);

x1 = funcLB;
y1 = feval(funcName, x1);
numFEval = numFEval + 1;

y2s = Inf * ones(funcDim, 1);
for d = 1 : funcDim
    x2 = x1;
    x2(d) = funcUB(d);
    y2s(d) = feval(funcName, x2);
    numFEval = numFEval + 1;
end

y3s = Inf * ones(funcDim, 1);
for d = 1 : funcDim
    x3 = x1;
    x3(d) = (funcUB(d) + funcLB(d)) / 2;
    y3s(d) = feval(funcName, x3);
    numFEval = numFEval + 1;
end

for i = 1 : (funcDim - 1)
    for j = (i + 1) : funcDim
        x4 = x1;
        x4(i) = funcUB(i);
        x4(j) = (funcUB(j) + funcLB(j)) / 2;
        y4 = feval(funcName, x4);
        numFEval = numFEval + 1;
        intMat(i, j) = abs((y1 - y2s(i)) - (y3s(j) - y4));
        intMat(j, i) = intMat(i, j);
    end
end

intMat = intMat > threshold;
labels = evoDiCoGraphPart(intMat);

funcPartSet = cell(max(labels) + 1, 1);
for d = 1 : length(labels)
    if sum(labels(d) == labels) > 1
        funcPartSet{labels(d)} = cat(1, funcPartSet{labels(d)}, d);
    else
        funcPartSet{end} = cat(1, funcPartSet{end}, d);
    end
end
funcPartSet = funcPartSet(~cellfun('isempty', funcPartSet));

funcParam.funcPartSet = funcPartSet;
funcParam.funcNumFEval = numFEval;
end
