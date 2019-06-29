function g = evoGradSphere_(x)
if all(size(x) ~= 1)
    error('the input should be a column or row vector.');
end
g = 2 * x;
end
