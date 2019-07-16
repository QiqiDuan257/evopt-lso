function evoCompCcFEvalBaseFunc(varargin)
% Compare (plot) Curve of Function Evaluations on the Base Function.
startRun = tic;
fprintf([evoCreateLine(14) ' * ccFEval * ' evoCreateLine(14) '\n']);
figure(20190701);
DATA = load(varargin{1});
funcParams = DATA.funcParams;
labels = varargin{nargin};
for f = 1 : length(funcParams)
    maxFEval = 0;
    for a = 1 : (nargin - 1)
        DATA = load(varargin{a});
        statOptRes = DATA.statOptRes;
        if statOptRes{f}.ccFEval(end, 1) > maxFEval
            maxFEval = statOptRes{f}.ccFEval(end, 1);
        end
    end
    for a = 1 : (nargin - 1)
        DATA = load(varargin{a});
        statOptRes = DATA.statOptRes;
        subplot(3, 3, f);
        semilogy(statOptRes{f}.ccFEval(:, 1), ...
            statOptRes{f}.ccFEval(:, 2), ...
            'LineWidth', 1.5);
        xlim([0 maxFEval]); hold on;
    end
    legend(labels); title(funcParams{f}.funcDim);
    xlabel('No. of FEval'); ylabel('opty');
end
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
end
