function x = evoColNumVect2RowNumVect(x)
% Transform a Column Numeric Vector into a Row Numeric Vector.
if isnumeric(x) && (length(size(x)) == 2) && (size(x, 2) == 1)
    x = x';
end
end
