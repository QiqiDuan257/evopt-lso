function isPosInt = evoCheckIsPosInt(x)
% Check whether the input is a Positive Integer.
isPosInt = isscalar(x) && isnumeric(x) && ...
    (floor(x) == x) && (x == ceil(x)) && (x > 0);
end
