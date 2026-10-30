%Protocol B: step towards neighbors
function W = makeWB(G)
n = size(G,1);
one = ones(n,1);
d = (G*one);
L = diag(d) - G; %Laplacian
epsilon = 1/max(d);
W = eye(n) - (epsilon)*L;
end