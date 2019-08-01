clear; clc;

% nohup matlab -nodesktop -nodisplay -nosplash <evoGsHcceaBFuncRun.m >evoGsHcceaBFuncRun.out 2>&1 &

funcParam.funcName = 'evoFuncSphere';
% funcParam.funcDims = [2 10];
evoGsHcceaBFunc(funcParam);
