function y = evoFuncReg1Norm_(x)
if all(size(x) ~= 1) || numel(size(x)) > 2
    error('the input should be a column or row vector.');
end
y = sum(abs(x));
end
