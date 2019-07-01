function outFreqVect = evoGetOutFreqVect(outFreq, maxFEval)
% Get the Output Frequency Vector of function evaluations.
if outFreq == 1
    outFreqVect = (1 : 1 : maxFEval)';
else
    outFreqVect = (0 : outFreq : maxFEval)';
    outFreqVect(1) = 1;
    if outFreqVect(end) ~= maxFEval
        outFreqVect(end + 1) = maxFEval;
    end
end
end
