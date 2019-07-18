function evoCompXOBaseFunc(varargin)
% Compare (plot) XO on the Base Function.
startRun = tic;
fprintf([evoCreateLine(14) ' * XO * ' evoCreateLine(14) '\n']);
figure(20190704);
DATA = load(varargin{1});
funcParams = DATA.funcParams;
labels = varargin{nargin};
funcDims = Inf * ones(length(funcParams), 1);
for f = 1 : length(funcParams)
    funcDims(f) = funcParams{f}.funcDim;
end

% ratioXO = numXO / numFEval
ratioXOs = Inf * ones(length(funcParams), nargin - 1);
axs = Inf * ones(1, nargin - 1);
for a = 1 : (nargin - 1)
    DATA = load(varargin{a});
    statOptRes = DATA.statOptRes;
    for f = 1 : length(funcParams)
        if isfield(statOptRes{f}, 'numXO')
            ratioXOs(f, a) = statOptRes{f}.numXO / statOptRes{f}.numFEval;
        else
            ratioXOs(f, a) = 0;
        end
    end
    ax = gca;
    ax.ColorOrderIndex = a;
    axs(a) = plot(funcDims, ratioXOs(:, a), '*', 'LineWidth', 7); hold on;
    plot(funcDims, ratioXOs(:, a), 'k:'); hold on;
end
legend(axs, labels); title('ratio of out-of-bound samples');
xlabel('funcDim'); ylabel('percentage (%)');
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
end
