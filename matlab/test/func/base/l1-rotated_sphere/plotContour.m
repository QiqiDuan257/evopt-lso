clear; clc;

%%
figure(1);
evoPlotContour('evoL1_RF_Sphere', -100 : 100, -100 : 100);

%%
figure(2);
evoPlotContour('evoL1_RF_Sphere', -50 : 0.1 : -35, 80 : 0.1 : 90, ...
    120 : 10 : 200);
