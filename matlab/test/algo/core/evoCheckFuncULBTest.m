clear; clc;

%%
evoCheckFuncULB(2, [1 1]', [-1 -1]', [1 1]', [-1 -1]');

%% `funcUB` should be a column numeric vector.
clear; clc;
evoCheckFuncULB(2, [1 1], [-1 -1]', [1 1]', [-1 -1]');

%% `funcLB` should be a column numeric vector.
clear; clc;
evoCheckFuncULB(2, [1 1]', [-1 -1], [1 1]', [-1 -1]');

%% `funcIniUB` should be a column numeric vector.
clear; clc;
evoCheckFuncULB(2, [1 1]', [-1 -1]', [1 1], [-1 -1]');

%% `funcIniLB` should be a column numeric vector.
clear; clc;
evoCheckFuncULB(2, [1 1]', [-1 -1]', [1 1]', [-1 -1]);

%% the dimension of `funcUB` should equal `funcDim`.
clear; clc;
evoCheckFuncULB(3, [1 1]', [-1 -1 -1]', [1 1 1]', [-1 -1 -1]');

%% the dimension of `funcLB` should equal `funcDim`.
clear; clc;
evoCheckFuncULB(3, [1 1 1]', [-1 -1]', [1 1 1]', [-1 -1 -1]');

%% the dimension of `funcIniUB` should equal `funcDim`.
clear; clc;
evoCheckFuncULB(3, [1 1 1]', [-1 -1 -1]', [1 1]', [-1 -1 -1]');

%% the dimension of `funcIniLB` should equal `funcDim`.
clear; clc;
evoCheckFuncULB(3, [1 1 1]', [-1 -1 -1]', [1 1 1]', [-1 -1]');

%% `funcUB` should be larger than `funcLB`.
clear; clc;
evoCheckFuncULB(2, [1 -1]', [-1 1]', [1 1]', [-1 -1]');

%% `funcUB` should be larger than `funcLB`.
clear; clc;
evoCheckFuncULB(2, [1 -1]', [-1 -1]', [1 1]', [-1 -1]');

%% `funcIniUB` should be larger than `funcIniLB`.
clear; clc;
evoCheckFuncULB(2, [1 1]', [-1 -1]', [1 -1]', [-1 1]');

%% `funcIniUB` should be larger than `funcIniLB`.
clear; clc;
evoCheckFuncULB(2, [1 1]', [-1 -1]', [1 -1]', [-1 -1]');
