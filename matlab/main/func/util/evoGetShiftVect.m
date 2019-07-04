function s = evoGetShiftVect(funcUB, funcLB, seed)
% Get the Shift Vector.
funcUB = evoRowNumVect2ColNumVect(funcUB);
funcLB = evoRowNumVect2ColNumVect(funcLB);

if ~evoCheckIsColNumVect(funcUB)
    error('`funcUB` should be a column numeric vector.');
end

if ~evoCheckIsColNumVect(funcLB)
    error('`funcLB` should be a column numeric vector.');
end

if any(size(funcUB) ~= size(funcLB))
    error('`size(funcUB)` shoud equal `size(funcLB)`.');
end

rng(seed);
s = unifrnd(funcLB, funcUB);
end
