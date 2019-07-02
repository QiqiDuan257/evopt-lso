function isColPosIntVect = evoCheckIsColPosIntVect(x)
% Check whether the input is a Column Positive Integer Vector.
isColPosIntVect = true;
if ~evoCheckIsColNumVect(x)
    isColPosIntVect = false;
else
    for d = 1 : numel(x)
        if ~evoCheckIsPosInt(x(d))
            isColPosIntVect = false;
            break;
        end
    end
end
end
