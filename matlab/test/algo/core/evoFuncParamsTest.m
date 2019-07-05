clear; clc;

%% true (1)
base = [1 1 1];
funcParam = {};
funcParam.funcName = '';
funcParam.funcDim = 3;
funcParam.funcUB = base';
funcParam.funcLB = -base';
funcParam.funcOptx = [Inf Inf Inf]';
funcParam.funcOpty = Inf;
funcParam = evoCheckFuncParam(funcParam);
disp(isequal(evoFuncParams('', 3, 1), funcParam));
disp(isequal(evoFuncParams('', 3, 1, -1), funcParam));
disp(isequal(evoFuncParams('', 3, 1, -1, 1), funcParam));
disp(isequal(evoFuncParams('', 3, 1, -1, 1, -1), funcParam));
disp(isequal(evoFuncParams('', 3, base, -1, 1, -1), funcParam));
disp(isequal(evoFuncParams('', 3, 1, -base, 1, -1), funcParam));
disp(isequal(evoFuncParams('', 3, 1, -1, base, -1), funcParam));
disp(isequal(evoFuncParams('', 3, 1, -1, 1, -base), funcParam));
disp(isequal(evoFuncParams('', 3, base', -1, 1, -1), funcParam));
disp(isequal(evoFuncParams('', 3, 1, -base', 1, -1), funcParam));
disp(isequal(evoFuncParams('', 3, 1, -1, base', -1), funcParam));
disp(isequal(evoFuncParams('', 3, 1, -1, 1, -base'), funcParam));
disp(isequal(evoFuncParams('', 3, base, -base, base, -base), funcParam));
disp(isequal(evoFuncParams('', 3, base', -base', base', -base'), funcParam));
disp(isequal(evoFuncParams('', 3, 1, -base, base, -1), funcParam));
disp(isequal(evoFuncParams('', 3, base', -1, 1, -base'), funcParam));

%% `funcName` should be of `char`, `string`, or `function_handle` type.
clear; clc;
evoFuncParams(true, 1, 100);

%% `funcDim` should be a positive integer.
clear; clc;
evoFuncParams('', 0);

%% set at least `funcName`, `funcDim`, and `funcUB`.
clear; clc;
evoFuncParams('', 100);

%% the dimension of `funcUB` should equal `funcDim`.
clear; clc;
evoFuncParams('', 2, [1 2 3]);

%% the dimension of `funcLB` should equal `funcDim`.
clear; clc;
evoFuncParams('', 2, 1, [1 2 3]');

%% the dimension of `funcIniUB` should equal `funcDim`.
clear; clc;
evoFuncParams('', 2, 1, 0, [1 2 3]');

%% the dimension of `funcIniLB` should equal `funcDim`.
clear; clc;
evoFuncParams('', 2, 1, 0, 1, [1 2 3]);

%% `funcUB` should be larger than `funcLB`.
clear; clc;
evoFuncParams('', 2, -1, 1);

%% `funcUB` should be larger than `funcLB`.
clear; clc;
evoFuncParams('', 2, [1 -1]', [-1 -1]);

%% `funcIniUB` should be larger than `funcIniLB`.
clear; clc;
evoFuncParams('', 2, 1, -1, 0, 1);

%% `funcIniUB` should be larger than `funcIniLB`.
clear; clc;
evoFuncParams('', 2, 1, -1, [1 0], [0 0]');
