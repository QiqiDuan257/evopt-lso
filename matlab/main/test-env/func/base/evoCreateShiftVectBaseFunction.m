function evoCreateShiftVectBaseFunction(funcName, seedBase)
% Create the Shift Vector for the Base Function.
startRun = tic;
funcDims = [2 1e1 1e2 1e3 2e3 4e3 6e3 8e3 1e4];
for d = 1 : length(funcDims)
    funcDim = funcDims(d);
    funcUB = 95 * ones(funcDim, 1);
    funcLB = -95 * ones(funcDim, 1);
    sv = evoGetShiftVect(funcUB, funcLB, seedBase + d);
    if (size(sv, 1) ~= funcDim) || ~evoCheckIsColNumVect(sv)
        error('`sv` should be a %d * 1 numeric vector.', funcDim);
    end
    save(sprintf('%s_s%d.mat', funcName, funcDim), 'sv', '-v7.3');
    fprintf('s%d: %7.2e\n', funcDim, toc(startRun));
end
fprintf(sprintf('\n$-runtime-$: %7.5e.\n', toc(startRun)));
end
