function evoCheckFuncULB(funcDim, funcUB, funcLB, funcIniUB, funcIniLB)
% Check UB + LB + IniUB + IniLB of the continuous objective Function.
if ~evoCheckIsColNumVect(funcUB)
    error('`funcUB` should be a column numeric vector.');
end
if ~evoCheckIsColNumVect(funcLB)
    error('`funcLB` should be a column numeric vector.');
end
if ~evoCheckIsColNumVect(funcIniUB)
    error('`funcIniUB` should be a column numeric vector.');
end
if ~evoCheckIsColNumVect(funcIniLB)
    error('`funcIniLB` should be a column numeric vector.');
end

if funcDim ~= numel(funcUB)
    error('the dimension of `funcUB` should equal `funcDim`.');
end
if funcDim ~= numel(funcLB)
    error('the dimension of `funcLB` should equal `funcDim`.');
end
if funcDim ~= numel(funcIniUB)
    error('the dimension of `funcIniUB` should equal `funcDim`.');
end
if funcDim ~= numel(funcIniLB)
    error('the dimension of `funcIniLB` should equal `funcDim`.');
end

if any(funcUB <= funcLB)
    error('`funcUB` should be larger than `funcLB`.');
end
if any(funcIniUB <= funcIniLB)
    error('`funcIniUB` should be larger than `funcIniLB`.');
end
end
