clear; clc;

%%
figure(1);
evoPlotContour('evoL1_RF_Ellipsoid', -100 : 100, -100 : 100);

%%
figure(2);
evoPlotContour('evoL1_RF_Ellipsoid', -70 : 0.05 : -60, -47 : 0.05 : -44, ...
    [10 .^ (2 : 6) (10 ^ 6) * (2 : 7)]);
