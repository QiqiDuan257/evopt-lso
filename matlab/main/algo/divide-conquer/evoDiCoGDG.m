function funcParam = evoDiCoGDG(funcParam)
% Global Differential Grouping (GDG).
%
% Input ->
%   funcParam: function parameters (struct)
% Output <-
%   funcParam: function parameters (struct)
%       +> funcPartSet  - partition set of the dimension indexes (cell)
%       +> funcPartType - partition types of `funcPartSet` (cell)
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

startCcFEval = tic;
ccFEval = y';
timeCcFEval = toc(startCcFEval);

% generate an interaction matrix according to the partition threshold
intMat = zeros(funcDim, funcDim);

x1 = funcLB;
y1 = feval(funcName, x1);
numFEval = numFEval + 1;

startCcFEval = tic;
ccFEval = cat(1, ccFEval, y1);
timeCcFEval = timeCcFEval + toc(startCcFEval);

y2s = Inf * ones(funcDim, 1);
for d = 1 : funcDim
    x2 = x1;
    x2(d) = funcUB(d);
    y2s(d) = feval(funcName, x2);
    numFEval = numFEval + 1;
end

startCcFEval = tic;
ccFEval = cat(1, ccFEval, y2s);
timeCcFEval = timeCcFEval + toc(startCcFEval);

y3s = Inf * ones(funcDim, 1);
for d = 1 : funcDim
    x3 = x1;
    x3(d) = (funcUB(d) + funcLB(d)) / 2;
    y3s(d) = feval(funcName, x3);
    numFEval = numFEval + 1;
end

startCcFEval = tic;
ccFEval = cat(1, ccFEval, y3s);
timeCcFEval = timeCcFEval + toc(startCcFEval);

for i = 1 : (funcDim - 1)
    for j = (i + 1) : funcDim
        x4 = x1;
        x4(i) = funcUB(i);
        x4(j) = (funcUB(j) + funcLB(j)) / 2;
        y4 = feval(funcName, x4);
        numFEval = numFEval + 1;
        intMat(i, j) = abs((y1 - y2s(i)) - (y3s(j) - y4));
        intMat(j, i) = intMat(i, j);
        
        startCcFEval = tic;
        ccFEval = cat(1, ccFEval, y4);
        timeCcFEval = timeCcFEval + toc(startCcFEval);
    end
end

intMat = intMat > threshold;
labels = evoDiCoGraphPart(intMat);

funcPartSet = cell(max(labels) + 1, 1);
funcPartType = cell(max(labels) + 1, 1);
for d = 1 : length(labels)
    if sum(labels(d) == labels) > 1
        funcPartSet{labels(d)} = cat(1, funcPartSet{labels(d)}, d);
        funcPartType{labels(d)} = 'nonSep';
    else
        funcPartSet{end} = cat(1, funcPartSet{end}, d);
        funcPartType{end} = 'sep';
    end
end
funcPartSet = funcPartSet(~cellfun('isempty', funcPartSet));
funcPartType = funcPartType(~cellfun('isempty', funcPartType));

funcParam.funcPartSet = funcPartSet;
funcParam.funcPartType = funcPartType;
funcParam.funcCcFEval = ccFEval;
funcParam.funcTimeCcFEval = timeCcFEval;
funcParam.funcNumFEval = numFEval;
end
