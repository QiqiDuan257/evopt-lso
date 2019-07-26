function labels = evoDiCoGraphPart(G)
% Graph Partition.
%
% Input ->
%   G      : graph represented in form of an adjacency matrix
%            (a matrix of size `funcDim` * `funcDim`)
% Output <-
%   labels : labels after partition (a column integer vector)
%
% Reference:
%   Mei, Y., Omidvar, M.N., Li, X. and Yao, X., 2016.
%   A competitive divide-and-conquer algorithm for
%   unconstrained large-scale black-box optimization.
%   ACM Transactions on Mathematical Software (TOMS), 42(2), pp.13-24.
labels = zeros(size(G, 1), 1); % 0 -> unpartitioned
indLabel = 0;
while true
    startNode = find(labels == 0, 1);
    if isempty(startNode)
        break;
    end
    indLabel = indLabel + 1;
    labels(startNode) = indLabel;
    while true
        expNodes = [];
        for i = 1 : length(startNode)
            % get connected nodes
            conNodes = find(G(startNode(i), :));
            % get only connected nodes which have not been unexplored
            indConNodes = conNodes(labels(conNodes) == 0);
            labels(indConNodes) = indLabel;
            % get newly explored nodes
            expNodes = cat(1, expNodes, indConNodes');
        end
        startNode = expNodes;
        if isempty(startNode)
            break;
        end
    end
end
