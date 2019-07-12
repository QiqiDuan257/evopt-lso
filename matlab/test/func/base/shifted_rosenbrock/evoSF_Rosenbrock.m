function y = evoSF_Rosenbrock(X)
persistent sv;
[funcDim, popSize] = size(X);
if isempty(sv) || (size(sv, 1) ~= funcDim)
    SSV = load(sprintf('./.evoRatationShift/evoSF_Rosenbrock_s%d.mat', funcDim));
    sv = SSV.sv;
    if any(size(sv) ~= [funcDim 1])
        error('`sv` should be a %d * 1 vector.', funcDim);
    end
    sv = repmat(sv, 1, popSize);
end
y = evoFuncRosenbrock(X - sv);
end
