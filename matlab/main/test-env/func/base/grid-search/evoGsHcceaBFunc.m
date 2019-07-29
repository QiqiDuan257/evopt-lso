function evoGsHcceaBFunc(funcParam)
% Grid Search for the partition number of HCCEA on the Base Function.
startRun = tic;
funcNumParts = [1 2 5 10 20 50 100 200 500 1000 2000 5000 10000];
rng(20190801); % for reproducibility
for p = 1 : length(funcNumParts)
    numPart = funcNumParts(p);
    funcParam.funcNumPart = numPart;
    fprintf([sprintf('@@@ NumPart - %d @@@:', numPart) '\n']);
    algoParam = {};
    algoParam.algoName = 'evoHCCEAPAS';
    algoParam.algoIniSeed = 20190102;
    algoParam.algoCorXO = true;
    evoCreateGsHcceaBFunc(funcParam, algoParam);
end
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
end
