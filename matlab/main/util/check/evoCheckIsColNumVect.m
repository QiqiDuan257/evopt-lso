function isColNumVect = evoCheckIsColNumVect(x)
% Check whether the input is a Column Numeric Vector.
if isnumeric(x) && (length(size(x)) == 2) && (size(x, 2) == 1)
    isColNumVect = true;
else
    isColNumVect = false;
end
end
