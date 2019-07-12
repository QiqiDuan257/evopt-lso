clear; clc;

% $ nohup matlab -nodesktop -nodisplay -nosplash <checkRMisOM.m >checkRMisOM.out 2>&1 &

startRun = tic;
funcDims = 2 : 1e9;
stopt = 3600 * 12;
for d = 1 : length(funcDims)
    if toc(startRun) >= stopt
        fprintf(' <- stopt');
        break;
    end
    fprintf(sprintf('\nD%d -> ...', funcDims(d)));
    RM = evoGetRotationMatrix(funcDims(d), 20190701 + d);
    if ~evoCheckIsOrthMatrix(RM)
        save('RMnotOM.mat', 'RM', '-v7.3');
        break;
    end
end
fprintf(sprintf('\n$-runtime-$: %7.5e.\n', toc(startRun)));

% D2 -> ...
% D3 -> ...
% D4 -> ...
% ...
% D2177 -> ...
% D2178 -> ...
% D2179 -> ...
% $-runtime-$: 1.10748e+04.
