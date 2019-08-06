function evoGsCompCcFEvalBFunc(varargin)
% Grid search: Compare Curve of Function Evaluations on the Base Function.
startRun = tic;
fprintf([evoCreateLine(14) ' * ccFEval * ' evoCreateLine(14) '\n']);
figure(20190701);
DATA = load(varargin{1});
funcParams = DATA.funcParams;
labels = varargin{nargin};
cmap = colormap(hsv(nargin - 1));
for f = 1 : length(funcParams)
    subplot(3, 3, f);
    maxFEval = 0;
    numLabel = 0;
    for a = 1 : (nargin - 1)
        DATA = load(varargin{a});
        statOptRes = DATA.statOptRes;
        for r = 1 : length(statOptRes)
            if statOptRes{r}.funcParam.funcDim == funcParams{f}.funcDim
                if statOptRes{r}.ccFEval(end, 1) > maxFEval
                    maxFEval = statOptRes{r}.ccFEval(end, 1);
                end
                numLabel = numLabel + 1;
            end
        end
    end
    for a = 1 : (nargin - 1)
        DATA = load(varargin{a});
        statOptRes = DATA.statOptRes;
        for r = 1 : length(statOptRes)
            if statOptRes{r}.funcParam.funcDim == funcParams{f}.funcDim
                semilogy(statOptRes{r}.ccFEval(:, 1), ...
                    statOptRes{r}.ccFEval(:, 2), ...
                    'Color', cmap(a, :), ...
                    'LineWidth', 1.5);
                xlim([0 maxFEval]); hold on;
            end
        end
    end
    legend(labels{1 : numLabel}); title(funcParams{f}.funcDim);
    xlabel('No. of FEval'); ylabel('opty');
end
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
end
