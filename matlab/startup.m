function startup
% Reference:
%   https://www.mathworks.com/help/matlab/ref/startup.html

% get all the *main* functions designed in the $evopt-lso$ library
cd('main');
addpath(genpath(pwd())); % update *search paths*
cd('..');

% print the log information when starting to use the $evopt-lso$ library
libInfo = evoGetLibInfoEVOPTLSO();
fprintf([evoCreateLine() '\n']);
fprintf(['#' evoCreateLine(15, ' ') ...
    '$$$ Enjoy the <evopt-lso> MATLAB Library $$$' ...
    evoCreateLine(16, ' ') '#\n']);
fprintf(['#' evoCreateLine(24, ' ') ...
    '--- version: ' libInfo.version ' ---' ...
    evoCreateLine(24, ' ') '#\n']);
fprintf([evoCreateLine() '\n']);
end
