function y = evoFuncRosenbrock_(x)
y = 100 * sum(((x(1 : (numel(x) - 1)) .^ 2) - x(2 : numel(x))) .^ 2) + ...
    sum((x(1 : (numel(x) - 1)) - 1) .^ 2);
end
