clear; clc;

%% true (1)
disp(evoCheckIsFuncName('evoFuncSphere'));
disp(evoCheckIsFuncName("evoFuncSphere"));
disp(evoCheckIsFuncName(@(X)(evoFuncSphere(X))));

%% false (0)
disp(evoCheckIsFuncName(true));
disp(evoCheckIsFuncName(0));
