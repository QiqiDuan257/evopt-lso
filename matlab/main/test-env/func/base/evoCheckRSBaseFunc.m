function evoCheckRSBaseFunc(funcName, optx, toleration)
% Check the correctness of the Rotated Shifted Base Function
%   on the optimal solution.
%
% Input ->
%   funcName   : function name (char or string)
%   optx       : optimal solution (scalar),
%                for all variables of the optimal solution,
%                there should be the same value,
%                optional, default: 0
%   toleration : error toleration (scalar),
%                optional, default: 1e-24
startRun = tic;
if nargin < 3
    toleration = 1e-24;
end
funcDims = [2 1e1 1e2 1e3 2e3 4e3 6e3 8e3 1e4];
for d = 1 : length(funcDims)
    funcDim = funcDims(d);
    if nargin < 2
        optxs = zeros(funcDim, 1);
    else
        optxs = optx * ones(funcDim, 1);
    end
    
    SSV = load(sprintf('./.evoRatationShift/%s_s%d.mat', ...
        funcName, funcDim));
    sv = SSV.sv;
    startFEval = tic;
    y = feval(funcName, sv + optxs);
    timeFEval = toc(startFEval);
    if ~evoCheckIsClose(y, 0, toleration)
        error('D%d: cannot pass the test.', funcDim);
    end
    fprintf('D%d: %7.2e\n', funcDim, timeFEval);
end
fprintf(sprintf('\n$-runtime-$: %7.5e.\n', toc(startRun)));
end
