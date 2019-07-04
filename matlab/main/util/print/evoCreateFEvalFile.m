function filename = evoCreateFEvalFile(algoName)
% Create a File to save the Function Evaluation curve.
foldername = '.evoFEvalFolder';
if ~evoCheckIsFolder(foldername)
    mkdir(foldername);
end
filename = ['./' foldername '/' algoName '.mat'];
end
