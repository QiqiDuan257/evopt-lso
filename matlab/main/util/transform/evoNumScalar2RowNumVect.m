function x = evoNumScalar2RowNumVect(x, funcDim)
% Transform a Numeric Scalar to a Row Numeric Vector.
if ~evoCheckIsPosInt(funcDim)
    error('`funcDim` should be a positive integer.');
end

if isscalar(x) && isnumeric(x)
    x = repmat(x, 1, funcDim);
end
end
