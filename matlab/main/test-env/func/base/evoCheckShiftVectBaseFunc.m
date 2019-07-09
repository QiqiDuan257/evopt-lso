function evoCheckShiftVectBaseFunc(funcName)
% Check the Shift Vector for the Base Function.
startRun = tic;
funcDims = [2 1e1 1e2 1e3 2e3 4e3 6e3 8e3 1e4];
for d = 1 : length(funcDims)
    funcDim = funcDims(d);
    funcUB = 95 * ones(funcDim, 1);
    funcLB = -95 * ones(funcDim, 1);
    SSV = load(sprintf('%s_s%d.mat', funcName, funcDim));
    sv = SSV.sv;
    if (size(sv, 1) ~= funcDim) || ~evoCheckIsColNumVect(sv)
        error('`sv` should be a %d * 1 numeric vector.', funcDim);
    end
    if any(sv > funcUB) || any(sv < funcLB)
        error('`sv` should be not out of search bound.');
    end
    figure(d);
    plot(sv, 'm.');
end
fprintf(sprintf('\n$-runtime-$: %7.5e.\n', toc(startRun)));
end
