function evoCheckBaseFunc1D5D(funcName, y, toleration)
% Check the correctness of the Base Function in both the 1-D and 5-D cases
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

% 5 1-D test samples
X1D = [-2 -1 0 1 2];
y1D = y(1 : 5);

% 7 5-D test samples
X5D = [...
    0 1 -1  1 1  1 -5; ...
    0 1 -1 -1 2 -2  4; ...
    0 1 -1  1 3  3  3; ...
    0 1 -1 -1 4 -4  2; ...
    0 1 -1  1 5  5 -1];
y5D = y(6 : end);

% check 1-D cases
func = funcName;
isClose = evoCheckIsClose(feval(func, X1D), y1D, toleration);
if ~isClose
    error('1-D case: check %s again.', func);
end
func = sprintf('%sPF', funcName);
isClose = evoCheckIsClose(feval(func, X1D'), y1D', toleration);
if ~isClose
    error('1-D case: check %s again.', func);
end
func = sprintf('%s_', funcName);
for t = 1 : size(X1D, 2)
    isClose = evoCheckIsClose(feval(func, X1D(t)), y1D(t), toleration);
    if ~isClose
        error('1-D case: check %s again.', func);
    end
end

% check 5-D cases
func = funcName;
isClose = evoCheckIsClose(feval(func, X5D), y5D, toleration);
if ~isClose
    error('5-D case: check %s again.', func);
end
func = sprintf('%sPF', funcName);
isClose = evoCheckIsClose(feval(func, X5D'), y5D', toleration);
if ~isClose
    error('5-D case: check %s again.', func);
end
func = sprintf('%s_', funcName);
for t = 1 : size(X5D, 2)
    isClose = evoCheckIsClose(feval(func, X5D(:, t)), y5D(t), toleration);
    if ~isClose
        error('5-D case: check %s again.', func);
    end
    isClose = evoCheckIsClose(feval(func, X5D(:, t)'), y5D(t), toleration);
    if ~isClose
        error('5-D case: check %s again.', func);
    end
end

fprintf('%s: pass the test.\n', funcName);
end
