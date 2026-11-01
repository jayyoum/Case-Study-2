function[G] = make_ring(n, k)

Sidentity = eye(n);
S = [Sidentity(1:n,2:n), Sidentity(1:n,1)];

% matrix G
G = zeros(n, n);

for j = 1:k 
    G = G + mpower(S, j) + mpower(S', j);
end

end