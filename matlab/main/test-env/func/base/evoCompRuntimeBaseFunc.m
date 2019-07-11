function evoCompRuntimeBaseFunc(varargin)
% Compare (plot) different Runtime on the Base Function.
startRun = tic;
fprintf([evoCreateLine(14, '#') ' * Runtime * ' evoCreateLine(14, '#') '\n']);
figure(20190702);
DATA = load(varargin{1});
funcParams = DATA.funcParams;
labels = varargin{nargin};
funcDims = Inf * ones(length(funcParams), 1);
for f = 1 : length(funcParams)
    funcDims(f) = funcParams{f}.funcDim;
end
runtimes = Inf * ones(length(funcParams), nargin - 1);
axs = Inf * ones(1, nargin - 1);
for a = 1 : (nargin - 1)
    DATA = load(varargin{a});
    statOptRes = DATA.statOptRes;
    for f = 1 : length(funcParams)
        runtimes(f, a) = statOptRes{f}.runtime;
    end
    ax = gca;
    ax.ColorOrderIndex = a;
    axs(a) = plot(funcDims, runtimes(:, a), '*', 'LineWidth', 7); hold on;
    plot(funcDims, runtimes(:, a), 'k:'); hold on;
end
legend(axs, labels); title('total runtime');
xlabel('funcDim'); ylabel('seconds');
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
end
