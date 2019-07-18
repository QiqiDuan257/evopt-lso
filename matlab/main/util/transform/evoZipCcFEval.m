function ccFEval = evoZipCcFEval(ccFEval, numFEval, freq)
% Zip the Convergence Curve of Function Evaluations with a given frequency.
if nargin < 3
    freq = 1000;
end
ccFEval = evoDecNumVect(ccFEval);
freqFEval = evoGetOutFreqVect(freq, numFEval);
ccFEval = cat(2, freqFEval, ccFEval(freqFEval));
end
