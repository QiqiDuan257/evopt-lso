function isFuncName = evoCheckIsFuncName(funcName)
% Check whether the Function Name is a char, string, or function_handle.
if ischar(funcName) || isstring(funcName) || isa(funcName, 'function_handle')
    isFuncName = true;
else
    isFuncName = false;
end
end
