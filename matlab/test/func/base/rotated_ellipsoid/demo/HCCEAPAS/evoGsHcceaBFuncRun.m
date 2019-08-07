clear; clc;

% nohup matlab -nodesktop -nodisplay -nosplash <evoGsHcceaBFuncRun.m >evoGsHcceaBFuncRun.out 2>&1 &

funcParam.funcName = 'evoRF_Ellipsoid';
% funcParam.funcDims = [2 10];
evoGsHcceaBFunc(funcParam);
