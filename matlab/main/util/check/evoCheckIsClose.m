function isClose = evoCheckIsClose(NMX, NMY, toleration)
% Check whether two numeric matrices are closed within the toleration.
%
% Input ->
%   NMX        : numeric matrix
%   NMY        : numeric matrix
%   toleration : scalar (default: 1e-24)
% Output <-
%   isClose    : true (1) or false (0)
if any(size(NMX) ~= size(NMY))
    error('two numeric matrices should have the same size.');
end

if nargin < 3
    toleration = 1e-24;
end

residuals = abs(NMX - NMY) < toleration;
isClose = all(residuals(:));
end
