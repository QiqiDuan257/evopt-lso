function y = evoFuncEllipsoidPF(X)
exponent = 10 .^ (6 * ((0 : (size(X, 2) - 1)) / (size(X, 2) - 1)))';
y = (X .^ 2) * exponent;
end
