function isfoldername = evoCheckIsFolder(foldername)
% Check whether the folder exists.
%
% NOTE that there has been a built-in function (introduced in R2017b).
% Here the goal is to be compatible with order MATLAB versions.
if ~exist('isfolder', 'builtin')
    if exist(foldername, 'dir')
        isfoldername = true;
    else
        isfoldername = false;
    end
else
    isfoldername = isfolder(foldername);
end
end
