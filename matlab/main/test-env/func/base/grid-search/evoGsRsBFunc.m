function evoGsRsBFunc(funcParam, popSizes)
% Grid Search for the population size of Random Search on the Base Function.
if nargin < 2
    popSizes = 10 .^ (0 : 4);
end

startRun = tic;
rng(20190801); % for reproducibility
for ps = 1 : length(popSizes)
    popSize = popSizes(ps);
    fprintf([sprintf('@@@ popSize - %d @@@:', popSize) '\n']);
    algoParam = {};
    algoParam.algoName = 'evoRS';
    algoParam.algoIniSeed = 20190101;
    algoParam.algoPopSize = popSize;
    evoCreateGsRsBFunc(funcParam, algoParam);
end
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
end
