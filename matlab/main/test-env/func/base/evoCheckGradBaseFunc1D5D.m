function evoCheckGradBaseFunc1D5D(funcGrad, y1D, y5D, toleration)
% Check the correctness of the Gradient of the Base function in both
%   the 1-D and 5-D cases via a total number of 12 test samples.
%
% Input ->
%   funcGrad   : function name (char or string)
%   y1D        : function gradients of 5 test samples (1 * 5 vector)
%   y5D        : function gradients of 7 test samples (5 * 7 matrix)
%   toleration : error toleration (scalar),
%                optional, default: 1e-24
if nargin < 4
    toleration = 1e-24;
end

if any(size(y1D) ~= [1 5])
    error('the input `y1D` should be a 1 * 5 numeric vector.');
end
if any(size(y5D) ~= [5 7])
    error('the input `y5D` should be a 5 * 7 numeric matrix.');
end

% 5 1-D test samples
X1D = [-2 -1 0 1 2];

% 7 5-D test samples
X5D = [...
    0 1 -1  1 1  1 -5; ...
    0 1 -1 -1 2 -2  4; ...
    0 1 -1  1 3  3  3; ...
    0 1 -1 -1 4 -4  2; ...
    0 1 -1  1 5  5 -1];

% check 1-D cases
isClose = evoCheckIsClose(feval(funcGrad, X1D), y1D, toleration);
if ~isClose
    error('1-D case: check %s again.', funcGrad);
end
isClose = evoCheckIsClose(feval(funcGrad, X1D'), y1D', toleration);
if ~isClose
    error('1-D case: check %s again.', funcGrad);
end

% check 5-D cases
for t = 1 : size(X5D, 2)
    isClose = evoCheckIsClose(feval(funcGrad, X5D(:, t)), ...
        y5D(:, t), toleration);
    if ~isClose
        error('5-D case: check %s again.', funcGrad);
    end
    isClose = evoCheckIsClose(feval(funcGrad, X5D(:, t)'), ...
        y5D(:, t)', toleration);
    if ~isClose
        error('5-D case: check %s again.', funcGrad);
    end
end

fprintf('%s: pass the test.\n', funcGrad);
end
