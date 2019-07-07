clear; clc;

%%
funcName = 'evoFuncEllipsoid';
y = [4000004 1000001 0 1000001 4000004 ...
    0 1067344.84 1067344.84 1067344.84 37643415.60 37643415.60 1292663.82];
evoCheckBaseFunc2D6D(funcName, y, 1e-2);
