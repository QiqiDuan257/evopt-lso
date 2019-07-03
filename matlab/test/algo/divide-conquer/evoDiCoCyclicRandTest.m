clear; clc;

%%
clear; clc;
rng(20191231);
funcParam.funcDim = 7;
funcParam.funcNumPart = 2;
funcParam = evoDiCoCyclicRand(funcParam);
disp(funcParam.funcPartSet{1}'); % 1 2 5 7
disp(funcParam.funcPartSet{2}'); % 3 4 6
disp(funcParam.funcNumFEval); % 0

%%
clear; clc;
rng(20191231);
funcParam.funcDim = 11;
funcParam.funcNumPart = 3;
funcParam = evoDiCoCyclicRand(funcParam);
disp(funcParam.funcPartSet{1}'); % 2 3 4 7
disp(funcParam.funcPartSet{2}'); % 1 6 9 10
disp(funcParam.funcPartSet{3}'); % 5 8 11
disp(funcParam.funcNumFEval); % 0

%%
clear; clc;
rng(20191231);
funcParam.funcDim = 7;
funcParam.funcNumPart = 3;
funcParam.funcDimSet = [10 11 20 21 99 30 31]';
funcParam = evoDiCoCyclicRand(funcParam);
disp(funcParam.funcPartSet{1}'); % 10 11 30
disp(funcParam.funcPartSet{2}'); % 20 99
disp(funcParam.funcPartSet{3}'); % 21 31
disp(funcParam.funcNumFEval); % 0

%% `funcDim` should be a field of `funcParam`.
clear; clc;
funcParam.funcName = '';
evoDiCoCyclicRand(funcParam);

%% `funcDim` should be a positive integer.
clear; clc;
funcParam.funcDim = 0;
evoDiCoCyclicRand(funcParam);

%% `funcNumPart` should be a field of `funcParam`.
clear; clc;
funcParam.funcDim = 10;
evoDiCoCyclicRand(funcParam);

%% `funcNumPart` should be a positive integer.
clear; clc;
funcParam.funcDim = 10;
funcParam.funcNumPart = 0;
evoDiCoCyclicRand(funcParam);

%%
clear; clc;
funcParam.funcDim = 5;
funcParam.funcNumPart = 1;
funcParam = evoDiCoCyclicRand(funcParam);

%%
clear; clc;
funcParam.funcDim = 5;
funcParam.funcNumPart = 7;
funcParam = evoDiCoCyclicRand(funcParam);

%% `funcDimSet` should be a 5 * 1 integer vector.
clear; clc;
funcParam.funcDim = 5;
funcParam.funcNumPart = 3;
funcParam.funcDimSet = [1 2]';
funcParam = evoDiCoCyclicRand(funcParam);

%% `funcDimSet` should be a 2 * 1 integer vector.
clear; clc;
funcParam.funcDim = 2;
funcParam.funcNumPart = 2;
funcParam.funcDimSet = [true false]';
funcParam = evoDiCoCyclicRand(funcParam);

%%
clear; clc;
funcParam.funcDim = 5;
funcParam.funcDimSet = (51 : 55)';
funcParam.funcNumPart = 7;
funcParam = evoDiCoCyclicRand(funcParam);
