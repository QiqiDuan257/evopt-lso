clear; clc;

%%
funcParam = {};
funcParam.funcName = 'evoFuncSphere';
funcParam.funcDim = 2;
funcParam.funcUB = [100, 100]';
funcParam.funcLB = [-100, -100]';
funcParam = evoCheckFuncParam(funcParam);
disp(funcParam);

%% `funcName` should be a field of `funcParam`.
clear; clc;
funcParam = {};
funcParam.funcDim = 2;
funcParam.funcUB = [100, 100]';
funcParam.funcLB = [-100, -100]';
evoCheckFuncParam(funcParam);

%% `funcName` should be of `char`, `string`, or `function_handle` type.
clear; clc;
funcParam = {};
funcParam.funcName = true;
funcParam.funcDim = 2;
funcParam.funcUB = [100, 100]';
funcParam.funcLB = [-100, -100]';
evoCheckFuncParam(funcParam);

%% `funcDim` should be a field of `funcParam`.
clear; clc;
funcParam = {};
funcParam.funcName = 'evoFuncSphere';
funcParam.funcUB = [100, 100]';
funcParam.funcLB = [-100, -100]';
evoCheckFuncParam(funcParam);

%% `funcDim` should be a positive integer.
clear; clc;
funcParam = {};
funcParam.funcName = 'evoFuncSphere';
funcParam.funcDim = 'a';
funcParam.funcUB = [100, 100]';
funcParam.funcLB = [-100, -100]';
evoCheckFuncParam(funcParam);

%% `funcDim` should be a positive integer.
clear; clc;
funcParam = {};
funcParam.funcName = 'evoFuncSphere';
funcParam.funcDim = 0;
funcParam.funcUB = [100, 100]';
funcParam.funcLB = [-100, -100]';
evoCheckFuncParam(funcParam);

%% `funcUB` should be a field of `funcParam`.
clear; clc;
funcParam = {};
funcParam.funcName = 'evoFuncSphere';
funcParam.funcDim = 2;
funcParam.funcLB = [-100, -100]';
evoCheckFuncParam(funcParam);

%% `funcLB` should be a field of `funcParam`.
clear; clc;
funcParam = {};
funcParam.funcName = 'evoFuncSphere';
funcParam.funcDim = 2;
funcParam.funcUB = [100, 100]';
evoCheckFuncParam(funcParam);

%% the dimension of `funcUB` should equal `funcDim`.
clear; clc;
funcParam = {};
funcParam.funcName = 'evoFuncSphere';
funcParam.funcDim = 3;
funcParam.funcUB = [100, 100]';
funcParam.funcLB = [-100, -100]';
evoCheckFuncParam(funcParam);

%% `funcUB` should be larger than `funcLB`.
clear; clc;
funcParam = {};
funcParam.funcName = 'evoFuncSphere';
funcParam.funcDim = 2;
funcParam.funcUB = [100, 100]';
funcParam.funcLB = [-100, 100]';
evoCheckFuncParam(funcParam);
