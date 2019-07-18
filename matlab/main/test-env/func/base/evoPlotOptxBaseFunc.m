function evoPlotOptxBaseFunc(varargin)
% Plot Optx on the Base Function.
startRun = tic;
fprintf([evoCreateLine(14) ' * optx * ' evoCreateLine(14) '\n']);
DATA = load(varargin{1});
funcParams = DATA.funcParams;
labels = varargin{nargin};
for f = 1 : length(funcParams)
    for a = 1 : (nargin - 1)
        DATA = load(varargin{a});
        optRes = DATA.statOptRes;
        subplot(3, 3, f);
        plot(optRes{f}.optx, '.'); hold on;
    end
    legend(labels); title(funcParams{f}.funcDim);
    xlabel('Dimension index'); ylabel('optx');
end
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
end
