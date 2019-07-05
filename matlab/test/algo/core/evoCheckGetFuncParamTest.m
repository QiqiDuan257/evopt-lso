clear; clc;

%%
funcParam = {};
funcParam.funcName = 'evoFuncSphere';
funcParam.funcDim = 2;
funcParam.funcUB = [100, 100]';
funcParam.funcLB = [-100, -100]';
[funcParam, funcName, funcDim, funcUB, funcLB, funcIniUB, funcIniLB] = ...
    evoCheckGetFuncParam(funcParam);
disp(funcName); % evoFuncSphere
disp(funcDim); % 2
disp(funcUB'); % 100 100
disp(funcLB'); % -100 -100
disp(funcIniUB'); % 100 100
disp(funcIniLB'); % -100 -100
disp(funcParam);

%%
funcParam = {};
funcParam.funcName = 'evoFuncSphere';
funcParam.funcDim = 2;
funcParam.funcUB = [100, 100]';
funcParam.funcLB = [-100, -100]';
funcParam.funcIniUB = [50, 50]';
funcParam.funcIniLB = [-50, -50]';
[funcParam, funcName, funcDim, funcUB, funcLB, funcIniUB, funcIniLB] = ...
    evoCheckGetFuncParam(funcParam);
disp(funcName); % evoFuncSphere
disp(funcDim); % 2
disp(funcUB'); % 100 100
disp(funcLB'); % -100 -100
disp(funcIniUB'); % 50 50
disp(funcIniLB'); % -50 -50
disp(funcParam);
