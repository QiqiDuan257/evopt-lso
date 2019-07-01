function x = evoDecNumVect(x)
% Transform the Numeric Vector in a Decreasing order.
if ~isnumeric(x) || all(size(x) ~= 1)
    error('the input should be a numeric vector.');
end

for i = 1 : (numel(x) - 1)
    if x(i + 1) > x(i)
        x(i + 1) = x(i);
    end
end
end
