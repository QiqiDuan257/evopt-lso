function evoGsPcmaesBFunc(funcParam, popSizes)
% Grid Search for the population size of PCMAES on the Base Function.
if nargin < 2
    popSizes = 2 .^ (1 : 2 : 15);
end

startRun = tic;
rng(20190801); % for reproducibility
for ps = 1 : length(popSizes)
    popSize = popSizes(ps);
    fprintf([sprintf('@@@ popSize - %d @@@:', popSize) '\n']);
    algoParam = {};
    algoParam.algoName = 'evoPCMAES';
    algoParam.algoIniSeed = 20190101;
    algoParam.algoPopSize = popSize;
    algoParam.algoStopy = 1e-10;
    algoParam.algoStopt = 3600 * 4;
    evoCreateGsRsBFunc(funcParam, algoParam);
end
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
end
