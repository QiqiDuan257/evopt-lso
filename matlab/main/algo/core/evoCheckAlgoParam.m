function algoParam = evoCheckAlgoParam(algoParam)
% Check whether some basic settings of `algoParam` are right.

% algoMaxFEval
if ~isfield(algoParam, 'algoMaxFEval')
    error('`algoMaxFEval` should be a field of `algoParam`.');
end
if ~evoCheckIsPosInt(algoParam.algoMaxFEval)
    error('`algoMaxFEval` should be a positive integer.');
end

% algoIniSeed
if ~isfield(algoParam, 'algoIniSeed')
    seed = int64(str2double(datestr(now, 'yyyymmdd')));
    rstream = RandStream('mt19937ar', 'Seed', seed);
    algoParam.algoIniSeed = randi(rstream, intmax, 1, 1);
end
if ~evoCheckIsNonNegInt(algoParam.algoIniSeed)
    error('`algoIniSeed` should be a nonnegative integer.');
end

% algoStopy
if ~isfield(algoParam, 'algoStopy')
    algoParam.algoStopy = -Inf;
end
stopy = algoParam.algoStopy;
if ~isscalar(stopy) || ~isnumeric(stopy) || isnan(stopy)
    error('`algoStopy` should be a non-nan numeric scalar.');
end

% algoStopt
if ~isfield(algoParam, 'algoStopt')
    algoParam.algoStopt = 7200; % seconds
end
algoStopt = algoParam.algoStopt;
if ~isscalar(algoStopt) || ~isnumeric(algoStopt) || isnan(algoStopt)
    error('`algoStopt` should be a non-nan numeric scalar.');
end
end
