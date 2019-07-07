function y = evoFuncEllipsoid_(x)
if all(size(x) ~= 1) || numel(size(x)) > 2
    error('the input should be a column or row vector.');
end

exponent = 10 .^ (6 * ((0 : (numel(x) - 1)) / (numel(x) - 1)));
if size(x, 1) > 1
    y = exponent * (x .^ 2);
else
    y = (x .^ 2) * exponent';
end
end
