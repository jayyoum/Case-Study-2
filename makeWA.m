% Protocol A: neighbor averaging
function W = makeWA(G)
n = size(G,1);
one = ones(n,1);
d = G*one;
D = diag(d);

W = inv(eye(n)+D)*(eye(n)+G);
end