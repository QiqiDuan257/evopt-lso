function funcParam = evoFuncParams(funcName, funcDim, ...
    funcUB, funcLB, ...
    funcIniUB, funcIniLB, ...
    funcOptx, funcOpty)
% Parameters of the continuous objective Function.
%
% Input ->
%   funcName  : function name (char or string) or function handle (@)
%   funcDim   : function dimension (int scalar)
%   funcUB    : upper bounds (UB) for all individuals during search
%               (column vector of length `funcDim`)
%   funcLB    : lower bounds (LB) for all individuals during search
%               (column vector of length `funcDim`),
%               optional, default: -1.0 * `funcUB`
%   funcIniUB : initial UB for all individuals when starting search
%               (column vector of length `funcDim`),
%               optional, default: `funcUB`
%   funcIniLB : initial LB for all individuals when starting search
%               (column vector of length `funcDim`),
%               optional, default: `funcLB`
%   funcOptx  : optimal solution x, i.e.,
%               optx (column vector of length `funcDim`),
%               optional, default: Inf * ones(`funcDim`, 1)
%   funcOpty  : optimal function value y, i.e.,
%               opty (scalar),
%               optional, default: Inf
% Output <-
%   funcParam : struct, function parameters
if ~evoCheckIsPosInt(funcDim)
    error('`funcDim` should be a positive integer.');
end

switch nargin
    case 8
    case 7
        funcOpty = Inf;
    case 6
        funcOptx = Inf * ones(funcDim, 1);
        funcOpty = Inf;
    case 5
        funcIniLB = funcLB;
        funcOptx = Inf * ones(funcDim, 1);
        funcOpty = Inf;
    case 4
        funcIniUB = funcUB;
        funcIniLB = funcLB;
        funcOptx = Inf * ones(funcDim, 1);
        funcOpty = Inf;
    case 3
        funcLB = -funcUB;
        funcIniUB = funcUB;
        funcIniLB = funcLB;
        funcOptx = Inf * ones(funcDim, 1);
        funcOpty = Inf;
    otherwise
        error('set at least `funcName`, `funcDim`, and `funcUB`.');
end

% transform a numeric scalar to a column numeric vector, if necessary
funcUB = evoNumScalar2ColNumVect(funcUB, funcDim);
funcLB = evoNumScalar2ColNumVect(funcLB, funcDim);
funcIniUB = evoNumScalar2ColNumVect(funcIniUB, funcDim);
funcIniLB = evoNumScalar2ColNumVect(funcIniLB, funcDim);

% transform a row numeric vector to a column numeric vector, if necessary
funcUB = evoRowNumVect2ColNumVect(funcUB);
funcLB = evoRowNumVect2ColNumVect(funcLB);
funcIniUB = evoRowNumVect2ColNumVect(funcIniUB);
funcIniLB = evoRowNumVect2ColNumVect(funcIniLB);

funcParam = struct('funcName', funcName, 'funcDim', funcDim, ...
    'funcUB', funcUB, 'funcLB', funcLB, ...
    'funcIniUB', funcIniUB, 'funcIniLB', funcIniLB, ...
    'funcOptx', funcOptx, 'funcOpty', funcOpty);

%
evoCheckFuncParam(funcParam);
end
