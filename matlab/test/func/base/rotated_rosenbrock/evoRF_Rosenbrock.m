function y = evoRF_Rosenbrock(X)
persistent RM sv;
[funcDim, popSize] = size(X);
if isempty(RM) || isempty(sv) || (size(RM, 1) ~= funcDim) || ...
        (size(RM, 2) ~= funcDim)  || (size(sv, 1) ~= funcDim)
    SRM = load(sprintf('./.evoRatationShift/evoRF_Rosenbrock_R%d.mat', funcDim));
    RM = SRM.RM;
    if any(size(RM) ~= [funcDim funcDim])
        error('`RM` should be a %d * %d matrix.', funcDim, funcDim);
    end
    SSV = load(sprintf('./.evoRatationShift/evoRF_Rosenbrock_s%d.mat', funcDim));
    sv = SSV.sv;
    if any(size(sv) ~= [funcDim 1])
        error('`sv` should be a %d * 1 vector.', funcDim);
    end
    sv = repmat(sv, 1, popSize);
end
y = evoFuncRosenbrock(RM * (X - sv));
end
