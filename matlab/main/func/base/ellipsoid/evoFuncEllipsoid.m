function y = evoFuncEllipsoid(X)
exponent = 10 .^ (6 * ((0 : (size(X, 1) - 1)) / (size(X, 1) - 1)));
y = exponent * (X .^ 2);
end
