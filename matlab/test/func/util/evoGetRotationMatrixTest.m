clear; clc;

%%
disp(evoGetRotationMatrix(2, 0));
disp(rank(evoGetRotationMatrix(2, 0))); % 2
%     0.2813    0.9596
%    -0.9596    0.2813
disp(evoGetRotationMatrix(2, 10));
disp(rank(evoGetRotationMatrix(2, 10))); % 2
%     0.4033   -0.9150
%     0.9150    0.4033
disp(evoGetRotationMatrix(2, 100));
disp(rank(evoGetRotationMatrix(2, 100))); % 2
%     0.2531   -0.9674
%    -0.9674   -0.2531

%%
disp(evoGetRotationMatrix(3, 0));
disp(rank(evoGetRotationMatrix(3, 0))); % 3
%     0.1817    0.6198   -0.7634
%     0.7236   -0.6100   -0.3230
%     0.6658    0.4938    0.5594
disp(evoGetRotationMatrix(3, 10));
disp(rank(evoGetRotationMatrix(3, 10))); % 3
%     0.3922   -0.8897    0.2339
%     0.8954    0.3108   -0.3190
%    -0.2111   -0.3345   -0.9184
disp(evoGetRotationMatrix(3, 100));
disp(rank(evoGetRotationMatrix(3, 100))); % 3
%     0.2369   -0.9056   -0.3518
%     0.5340   -0.1811    0.8259
%     0.8116    0.3836   -0.4407
