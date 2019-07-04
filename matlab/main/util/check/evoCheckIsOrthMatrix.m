function isOrthMatrix = evoCheckIsOrthMatrix(X, toleration)
% Check whether the input is a Orthogonal Matrix.
if size(X, 1) ~= size(X, 2)
    error('the input should be a square matrix.');
end

if nargin < 2
    toleration = 1e-6;
end

condA = abs(X * X' - eye(size(X))) < toleration;
condB = abs(X' * X - eye(size(X))) < toleration;
condC = abs(sum(X .^ 2, 1) - 1) < toleration;
condD = abs(sum(X .^ 2, 2) - 1) < toleration;
condE = rank(X) == size(X, 1);
detX = det(X);
condF = (abs(detX - 1) < toleration) || (abs(detX + 1) < toleration);

if all(condA(:)) && all(condB(:)) && all(condC(:)) && all(condD(:)) && ...
        condE && condF
    isOrthMatrix = true;
else
    isOrthMatrix = false;
end
end
