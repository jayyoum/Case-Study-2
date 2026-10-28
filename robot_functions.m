
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

G = double(delta <= r^2);
G(1:n+1:end) = 0;

end
    