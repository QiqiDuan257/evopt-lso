function evoPlotCcFEvalBaseFunc(varargin)
% Plot (compare) Curve of Function Evaluations on the Base Function.
%
% Input ->
%   funcName : function name (char or string)
%   algoName : algorithm name (char or string)
startRun = tic;
funcDims = [2 1e1 1e2 1e3 2e3 4e3 6e3 8e3 1e4];
labels = varargin(2 : nargin);
for d = 1 : length(funcDims)
    for a = 2 : nargin
        funcDim = funcDims(d);
        figure(funcDim);
        DATA = load(sprintf('%s_%s_D%d', varargin{a}, varargin{1}, funcDim));
        ccFEval = DATA.ccFEval;
        semilogy(ccFEval, '.'); hold on;
    end
    legend(labels); title(funcDim);
    xlabel('No. of FEval'); ylabel('opty');
end
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
end
