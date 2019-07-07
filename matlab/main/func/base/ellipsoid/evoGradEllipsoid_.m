function g = evoGradEllipsoid_(x)
if all(size(x) ~= 1) || numel(size(x)) > 2
    error('the input should be a column or row vector.');
end

exponent = 10 .^ (6 * ((0 : (numel(x) - 1)) / (numel(x) - 1)));
if size(x, 1) > 1
    g = 2 * x .* exponent';
else
    g = 2 * x .* exponent;
end
end
