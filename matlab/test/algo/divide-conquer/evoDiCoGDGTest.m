clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <evoDiCoGDGTest.m >evoDiCoGDGTest.out 2>&1 &

%%
startRun = tic;
funcNames = {'evoFuncSphere', 'evoFuncEllipsoid', 'evoFuncRosenbrock'};
% funcDims = [2 10 100 1000 2000 4000 6000 8000 10000];
funcDims = [2 10 100 1000 2000];
for f = 1 : length(funcNames)
    funcName = funcNames{f};
    funcParams = cell(length(funcDims), 1);
    for d = 1 : length(funcDims)
        startDimRun = tic;
        funcDim = funcDims(d);
        funcParam = evoFuncParams(funcName, funcDim, 100);
        funcParams{d} = evoDiCoGDG(funcParam);
        fprintf(sprintf('%d - %7.5e.\n', funcDim, toc(startDimRun)));
    end
    save(sprintf('%s.mat', funcName), 'funcParams', '-v7.3');
end
fprintf(sprintf('$-runtime-$: %7.5e.\n', toc(startRun)));

%%
clear; clc;
funcName = @(X)(sum(X([1 3], :), 1) .^ 2 + sum(X([2 4 5], :), 1) .^ 2);
funcParam = evoFuncParams(funcName, 5, 100);
funcParam = evoDiCoGDG(funcParam);
disp(funcParam);

%%
clear; clc;
funcName = @(X)(sum(X(101 : 150, :), 1) .^ 2 + ...
    sum(X([(1 : 100) 200], :), 1) .^ 2 + ...
    sum(X(151 : 199, :), 1) .^ 2);
funcParam = evoFuncParams(funcName, 200, 100);
funcParam = evoDiCoGDG(funcParam);
disp(funcParam);

%%
clear; clc;
funcName = @(X)(sum(X([1 3 5], :), 1) .^ 2 + ...
    sum(X(2, :), 1) .^ 2 + ...
    sum(X(4, :), 1) .^ 2 + ...
    sum(X(6 : 10, :), 1) .^ 2);
funcParam = evoFuncParams(funcName, 10, 100);
funcParam = evoDiCoGDG(funcParam);
