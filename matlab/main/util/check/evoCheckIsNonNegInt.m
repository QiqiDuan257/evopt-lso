function isNonNegInt = evoCheckIsNonNegInt(x)
% Check whether the input is a NonNegative Integer.
isNonNegInt = isscalar(x) && isnumeric(x) && ...
    (floor(x) == x) && (x == ceil(x)) && (x >= 0);
end
