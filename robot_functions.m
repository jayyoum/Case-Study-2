
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

% where s is the left-shifted identity matrix
% cyclic shift matrix S
n = 100;
Sidentity = eye(n,n)
S = [Sidentity(1:n,2:n),Sidentity(1:n,1)]

% matrix G
G = zeros(n, n);

for j = 1:k
    G = G + mpower(S, j) + mpower(S', j);
end

end

function[G] = make_disk(P,r)
one = ones(n,1);
s = sum(P.^2,2); %sq every element, sum along rows

delta = (s*one')+(one*s')-(2*(P*P'));
G = delta < r^2; %idk
G = G - diag(diag(G)); %take diagonal values of G, then make diagonal matrix w those values

end
    