function evoCompTimeFEvalBaseFunc(varargin)
% Compare (plot) Time of Function Evaluations on the Base Function.
startRun = tic;
fprintf([evoCreateLine(14) ' * timeFEval * ' evoCreateLine(14) '\n']);
figure(20190703);
labels = varargin{nargin};

DATA = load(varargin{1});
funcParams = DATA.funcParams;
funcDims = Inf * ones(length(funcParams), 1);
for f = 1 : length(funcParams)
    funcDims(f) = funcParams{f}.funcDim;
end

runtimes = Inf * ones(length(funcParams), nargin - 1);
timeFEvals = Inf * ones(length(funcParams), nargin - 1);
numFEvals = Inf * ones(length(funcParams), nargin - 1);
for a = 1 : (nargin - 1)
    DATA = load(varargin{a});
    statOptRes = DATA.statOptRes;
    for f = 1 : length(funcParams)
        runtimes(f, a) = statOptRes{f}.runtime;
        timeFEvals(f, a) = statOptRes{f}.timeFEval;
        numFEvals(f, a) = statOptRes{f}.numFEval;
    end
end

% ratioFEval = timeFEval /  runtime
ratioFEvals = timeFEvals ./  runtimes;
subplot(1, 3, 1);
axs = Inf * ones(1, nargin - 1);
for a = 1 : (nargin - 1)
    ax = gca;
    ax.ColorOrderIndex = a;
    axs(a) = plot(funcDims, ratioFEvals(:, a), '*', 'LineWidth', 7); hold on;
    plot(funcDims, ratioFEvals(:, a), 'k:'); hold on;
end
legend(axs, labels); title('ratioFEval');
xlabel('funcDim'); ylabel('timeFEval / runtime');

% costFEval = runtimes / numFEval
costFEvals = runtimes ./ numFEvals;
subplot(1, 3, 2);
axs = Inf * ones(1, nargin - 1);
for a = 1 : (nargin - 1)
    ax = gca;
    ax.ColorOrderIndex = a;
    axs(a) = plot(funcDims, costFEvals(:, a), '*', 'LineWidth', 7); hold on;
    plot(funcDims, costFEvals(:, a), 'k:'); hold on;
end
legend(axs, labels); title('costFEval');
xlabel('funcDim'); ylabel('runtime / numFEval');

% normFEval = timeFEval / numFEval
normFEvals = timeFEvals ./ numFEvals;
subplot(1, 3, 3);
axs = Inf * ones(1, nargin - 1);
for a = 1 : (nargin - 1)
    ax = gca;
    ax.ColorOrderIndex = a;
    axs(a) = plot(funcDims, normFEvals(:, a), '*', 'LineWidth', 7); hold on;
    plot(funcDims, normFEvals(:, a), 'k:'); hold on;
end
legend(axs, labels); title('normFEval');
xlabel('funcDim'); ylabel('timeFEval / numFEval');
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
end
