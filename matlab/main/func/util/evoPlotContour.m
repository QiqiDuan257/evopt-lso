function evoPlotContour(funcName, x, y, levels)
% Plot the 2-D Contour of the continuous function.
%
% Input ->
%   funcName: function name (char or string)
%   x       : x-coordinates (numeric vector)
%   y       : y-coordinates (numeric vector)
%   levels  : contour levels (numeric vector)
%
% Reference:
%   https://www.mathworks.com/help/matlab/ref/contourf.html
if nargin < 4
    isShowLevel = false;
else
    isShowLevel = true;
end

[X, Y] = meshgrid(x, y);
Z = Inf * ones(size(X));
for r = 1 : size(X, 1)
    for c = 1 : size(X, 2)
        Z(r, c) = feval(funcName, [X(r, c), Y(r, c)]');
    end
end

if isShowLevel
    [C, h] = contourf(X, Y, Z, levels, ...
        'ShowText', 'on', 'EdgeColor', 'white', 'LineWidth', 1.5);
else
    [C, h] = contourf(X, Y, Z, ...
        'ShowText', 'on', 'EdgeColor', 'white', 'LineWidth', 1.5);
end
clabel(C, h, 'FontSize', 12, 'Color', 'white');
title(funcName); xlabel('x_1'); ylabel('x_2');
end
