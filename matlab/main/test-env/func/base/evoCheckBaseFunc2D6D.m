function evoCheckBaseFunc2D6D(funcName, y, toleration)
% Check the correctness of the Base Function in both the 2-D and 6-D cases
%   via a total number of 12 test samples.
%
% Input ->
%   funcName   : function name (char or string)
%   y          : function values of 12 test samples (row vector)
%   toleration : error toleration (scalar),
%                optional, default: 1e-24
if nargin < 3
    toleration = 1e-24;
end

if any(size(y) ~= [1 12])
    error('the input `y` should be a 1 * 12 row numeric vector.');
end

% 5 2-D test samples
X2D = [...
    -2 -1 0 1 2; ...
     2  1 0 1 2];
y2D = y(1 : 5);

% 7 6-D test samples
X6D = [...
    0 1 -1  1 1  1 -6; ...
    0 1 -1 -1 2 -2  5; ...
    0 1 -1  1 3  3  4; ...
    0 1 -1 -1 4 -4  3; ...
    0 1 -1  1 5  5  2; ...
    0 1 -1  1 6 -6 -1];
y6D = y(6 : end);

% check 2-D cases
func = funcName;
isClose = evoCheckIsClose(feval(func, X2D), y2D, toleration);
if ~isClose
    error('2-D case: check %s again.', func);
end
func = sprintf('%sPF', funcName);
isClose = evoCheckIsClose(feval(func, X2D'), y2D', toleration);
if ~isClose
    error('2-D case: check %s again.', func);
end
func = sprintf('%s_', funcName);
for t = 1 : size(X2D, 2)
    isClose = evoCheckIsClose(feval(func, X2D(:, t)), y2D(t), toleration);
    if ~isClose
        error('2-D case: check %s again.', func);
    end
    isClose = evoCheckIsClose(feval(func, X2D(:, t)'), y2D(t), toleration);
    if ~isClose
        error('2-D case: check %s again.', func);
    end
end

% check 6-D cases
func = funcName;
isClose = evoCheckIsClose(feval(func, X6D), y6D, toleration);
if ~isClose
    error('6-D case: check %s again.', func);
end
func = sprintf('%sPF', funcName);
isClose = evoCheckIsClose(feval(func, X6D'), y6D', toleration);
if ~isClose
    error('6-D case: check %s again.', func);
end
func = sprintf('%s_', funcName);
for t = 1 : size(X6D, 2)
    isClose = evoCheckIsClose(feval(func, X6D(:, t)), y6D(t), toleration);
    if ~isClose
        error('6-D case: check %s again.', func);
    end
    isClose = evoCheckIsClose(feval(func, X6D(:, t)'), y6D(t), toleration);
    if ~isClose
        error('6-D case: check %s again.', func);
    end
end

fprintf('%s: pass the test.\n', funcName);
end
