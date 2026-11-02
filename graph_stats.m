function[degree, edge_count, diam] = graph_stats(G)

n = size(G, 1);
one = ones(n, 1);

%degree
degree = G*one;

%number of edges
edge_count = (1/2) * (dot(degree, one));

%diameter
A = eye(n) + G;
R = A;

diam = inf;

for k = 1:n

    if all(R(:) > 0) %checks if every pair of robots is reachable
        diam = k; %if it is, diameter is k
        break;
    end

    R = double(A * R > 0); %converts every positive entry to 1, 
    % making R a matrix of reachable connections (denoted 1 or 0) instead
    % of a matrix of walks required to reach (numbers would become huge)

    %in the case not all robots are reachable yet, we loop back
end

end