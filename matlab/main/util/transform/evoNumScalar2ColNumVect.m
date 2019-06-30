function x = evoNumScalar2ColNumVect(x, funcDim)
% Transform a Numeric Scalar to a Column Numeric Vector.
if ~evoCheckIsPosInt(funcDim)
    error('`funcDim` should be a positive integer.');
end

if isscalar(x) && isnumeric(x)
    x = repmat(x, funcDim, 1);
end
end
