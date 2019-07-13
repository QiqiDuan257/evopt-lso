function evoCheckGradBaseFunc2D6D(funcGrad, y2D, y6D, toleration)
% Check the correctness of the Gradient of the Base function in both
%   the 2-D and 6-D cases via a total number of 12 test samples.
%
% Input ->
%   funcGrad   : function name (char or string)
%   y2D        : function gradients of 5 test samples (2 * 5 vector)
%   y6D        : function gradients of 7 test samples (6 * 7 matrix)
%   toleration : error toleration (scalar),
%                optional, default: 1e-24
if nargin < 4
    toleration = 1e-24;
end

if any(size(y2D) ~= [2 5])
    error('the input `y2D` should be a 2 * 5 numeric matrix.');
end
if any(size(y6D) ~= [6 7])
    error('the input `y6D` should be a 6 * 7 numeric matrix.');
end

% 5 2-D test samples
X2D = [...
    -2 -1 0 1 2; ...
     2 1 0 1 2];

% 7 6-D test samples
X6D = [...
    0 1 -1  1 1  1 -6; ...
    0 1 -1 -1 2 -2  5; ...
    0 1 -1  1 3  3  4; ...
    0 1 -1 -1 4 -4  3; ...
    0 1 -1  1 5  5  2; ...
    0 1 -1  1 6 -6 -1];

% check 2-D cases
for t = 1 : size(X2D, 2)
    isClose = evoCheckIsClose(feval(funcGrad, X2D(:, t)), ...
        y2D(:, t), toleration);
    if ~isClose
        error('2-D case: check %s again.', funcGrad);
    end
    isClose = evoCheckIsClose(feval(funcGrad, X2D(:, t)'), ...
        y2D(:, t)', toleration);
    if ~isClose
        error('2-D case: check %s again.', funcGrad);
    end
end

% check 6-D cases
for t = 1 : size(X6D, 2)
    isClose = evoCheckIsClose(feval(funcGrad, X6D(:, t)), ...
        y6D(:, t), toleration);
    if ~isClose
        error('6-D case: check %s again.', funcGrad);
    end
    isClose = evoCheckIsClose(feval(funcGrad, X6D(:, t)'), ...
        y6D(:, t)', toleration);
    if ~isClose
        error('6-D case: check %s again.', funcGrad);
    end
end

fprintf('%s: pass the test.\n', funcGrad);
end
