function A = adjacenci(G, w)
%ADJACENCY Graph adjacency matrix
%   A = ADJACENCY(G) returns a numnodes(G)-by-numnodes(G) sparse matrix
%   with A(i,j) = 1 if (i,j) is an edge in graph G. Otherwise, A(i,j) = 0.
%
%   A = ADJACENCY(G, 'weighted') returns a weighted adjacency matrix, where
%   for each edge (i,j), the value A(i,j) contains the weight of the edge.
%   If the graph has no edge weights, then A(i,j) is set to 1. For this
%   syntax, G must be a simple graph.
%
%   A = ADJACENCY(G, W) returns a weighted adjacency matrix with edge
%   weights given by vector W. The value A(i,j) = W(findedge(G, i, j)) if
%   (i,j) is an edge of graph G. For this syntax, G must be a simple graph.
%
%   Example:
%       % Create a graph, and then compute its adjacency matrix.
%       s = [1 1 1 2 3];
%       t = [2 3 4 3 4];
%       G = graph(s,t)
%       A = adjacency(G)
%
%   See also GRAPH, INCIDENCE, LAPLACIAN

%   Copyright 2014-2017 The MathWorks, Inc.

if nargin <= 1
    A = adjacenci(G.Underlying);
else
    if graph.isvalidoption(w) && graph.partialMatch(w, 'weighted')
        if hasEdgeWeights(G)
            w = G.EdgeProperties.Weight;
        else
            w = ones(numedges(G), 1);
        end
    elseif (isnumeric(w) || islogical(w)) && isvector(w)
        if length(w) ~= numedges(G) || (~isa(w, 'double') && ~islogical(w))
            error(message('MATLAB:graphfun:adjacency:InvalidWeightVector'));
        end
        w = full(w);
    else
        error(message('MATLAB:graphfun:adjacency:InvalidWeights'));
    end
    
    if ismultigraph(G.Underlying)
        error(message('MATLAB:graphfun:adjacency:WeightedMultigraph'));
    end

    A = adjacenci(G.Underlying, w);
end