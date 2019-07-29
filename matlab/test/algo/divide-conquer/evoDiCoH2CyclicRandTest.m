clear; clc;

%%
clear; clc;
funcParam.funcDim = 11;
funcParam.funcNumPart = 2;
funcParam.funcPartSet = {[11 10 1 2]'; 8; [3 7 5]'; [4 6]'; 9};
funcParam.funcPartType = {'nonSep'; 'sep'; 'sep'; 'nonSep'; 'sep'};
funcParam = evoDiCoH2CyclicRand(funcParam);

%%
clear; clc;
funcParam.funcDim = 10;
funcParam.funcNumPart = 5;
funcParam.funcPartSet = {(10 : -1 : 1)'};
funcParam.funcPartType = {'sep'};
funcParam = evoDiCoH2CyclicRand(funcParam);

%%
clear; clc;
funcParam.funcDim = 10;
funcParam.funcNumPart = 5;
funcParam.funcPartSet = {(10 : -1 : 1)'};
funcParam.funcPartType = {'nonSep'};
funcParam = evoDiCoH2CyclicRand(funcParam);

%%
clear; clc;
funcParam.funcDim = 10;
funcParam.funcNumPart = 3;
funcParam.funcPartSet = {(10 : -1 : 1)'};
funcParam.funcPartType = {'sep'};
funcParam = evoDiCoH2CyclicRand(funcParam);

%%
clear; clc;
funcParam.funcDim = 10;
funcParam.funcNumPart = 3;
funcParam.funcPartSet = {(10 : -1 : 1)'};
funcParam.funcPartType = {'nonSep'};
funcParam = evoDiCoH2CyclicRand(funcParam);

%%
clear; clc;
funcParam.funcDim = 112;
funcParam.funcNumPart = 2;
funcParam.funcPartSet = {1; 2; [3 4 5]'; (6 : 10)'; (11 : 112)'};
funcParam.funcPartType = {'sep'; 'sep'; 'nonSep'; 'sep'; 'nonSep'};
funcParam = evoDiCoH2CyclicRand(funcParam);
