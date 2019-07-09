function evoCreateOrthMatBaseFunc(funcName, seedBase)
% Create the Orthogonal Matrix for the Base Function.
startRun = tic;
funcDims = [2 1e1 1e2 1e3 2e3 4e3 6e3 8e3 1e4];
for d = 1 : length(funcDims)
    funcDim = funcDims(d);
    RM = evoGetRotationMatrix(funcDim, seedBase + d);
    if (size(RM, 1) ~= size(RM, 2)) || (size(RM, 1) ~= funcDim)
        error('RM should be a %d * %d square matrix.', funcDim, funcDim);
    end
    save(sprintf('%s_R%d.mat', funcName, funcDim), 'RM', '-v7.3');
    fprintf('R%d: %7.2e\n', funcDim, toc(startRun));
end
fprintf(sprintf('\n$-runtime-$: %7.5e.\n', toc(startRun)));
end
