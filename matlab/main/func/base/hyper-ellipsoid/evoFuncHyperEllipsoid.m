function y = evoFuncHyperEllipsoid(X)
[funcDim, popSize] = size(X);
y = sum((repmat((1 : funcDim)', 1, popSize) .* X) .^ 2, 1);
end
