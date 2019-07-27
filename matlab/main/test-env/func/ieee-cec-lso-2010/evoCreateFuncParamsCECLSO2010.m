function funcParams = evoCreateFuncParamsCECLSO2010()
% Create a set of `FuncParam` for IEEE-CEC-LSO-2010.
funcParams = cell(20, 1);
for f = 1 : length(funcParams)
    funcName = sprintf('evoFuncCECLSO2010F%02d', f);
    if ismember(f, [1 4 7 8 9 12 13 14 17 18 19 20])
        funcUB = 100;
    elseif ismember(f, [2 5 10 15])
        funcUB = 5;
    elseif ismember(f, [3 6 11 16])
        funcUB = 32;
    end
    funcParams{f} = evoFuncParams(funcName, 1000, funcUB);
    funcParams{f}.funcNumPart = 500;
end
end
