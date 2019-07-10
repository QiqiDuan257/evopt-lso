function subX = evoDiCoFEval(subX, optx, subDim)
% Decomposition-based Function Evaluation.
%
% Input ->
%   subX   : all the individuals of a subpopulation
%            (matrix of size `subFuncDim` * `subPopSize`)
%   optx   : the best-so-far solution during search
%            (column vector of length `funcDim`)
%   subDim : dimension indexes of a subpopulation on the original function
%            (int vector)
% Output <-
%   subX   : all the individuals of a subpopulation after being combined
%            with the best-so-far solution
%            (matrix of size `funcDim` * `subPopSize`)
optX = repmat(optx, 1, size(subX, 2));
optX(subDim, :) = subX;
subX = optX;
end
