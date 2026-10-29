
function[G] = make_complete(n)

one = ones(n, n);
G = one - eye(n);

end

function[G] = make_star(n)

G = zeros(n, n);
G(1, 2:n) = 1;
G(2:n,  1) = 1;

end

function[G] = make_ring(n, k)

Sidentity = eye(n)
S = [Sidentity(1:n,2:n), Sidentity(1:n,1)];

% matrix G
G = zeros(n, n);

for j = 1:k 
    G = G + mpower(S, j) + mpower(S', j);
end

end

function[G] = make_disk(P,r)
n = size(P, 1);
one = ones(n,1);
s = sum(P.^2,2); %sq every element, sum along rows

delta = (s*one')+(one*s')-(2*(P*P'));

G = double(delta <= r^2); %for each robot pair, convert distance into 1 or 0 based on whether the robots are within radius
G(1:n+1:end) = 0; %set the diagonal of G to 0, avoiding self-connection.

end
    
%test matthew
%%C ------ Protocols --------

% Protocol A: neighbor averaging
function W = makeWA(G)
n = size(G,1);
one = ones(n,1);
d = G*one;
D = diag(d);

W = inv(eye(n)+D)*(eye(n)+G);
end

%Protocol B: step towards neighbors
function W = makeWB(G)
n = size(G,1);
one = ones(n,1);
d = (G*one);
L = diag(d) - G; %Laplacian
epsilon = 1/max(d);
W = eye(n) - (epsilon)*L;
end