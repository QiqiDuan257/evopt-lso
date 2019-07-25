clear; clc;

% nohup matlab -nodesktop -nodisplay -nosplash <evoGsRsBFuncRun.m >evoGsRsBFuncRun.out 2>&1 &

funcParam.funcName = 'evoFuncSphere';
% funcParam.funcDims = [2 10];
evoGsRsBFunc(funcParam);
