clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <checkSeparability.m >checkSeparability.out 2>&1 &

%% GDG
startRun = tic;
funcName = 'evoFuncSphere';
funcDims = [2 10 100 1000 2000 4000 6000 8000 10000];
% funcDims = [2 10];
funcParams = cell(length(funcDims), 1);
for d = 1 : length(funcDims)
    startDimRun = tic;
    funcDim = funcDims(d);
    funcParam = evoFuncParams(funcName, funcDim, 100);
    funcParams{d} = evoDiCoGDG(funcParam);
    fprintf(sprintf('%d - %7.5e.\n', funcDim, toc(startDimRun)));
end
save(sprintf('GDG-%s.mat', funcName), 'funcParams', '-v7.3');
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));
