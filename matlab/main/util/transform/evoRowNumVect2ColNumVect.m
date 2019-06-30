function x = evoRowNumVect2ColNumVect(x)
% Transform a Row Numeric Vector into a Column Numeric Vector.
if isnumeric(x) && (length(size(x)) == 2) && (size(x, 1) == 1)
    x = x';
end
end
