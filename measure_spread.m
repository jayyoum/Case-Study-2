function delta = measure_spread(X, Y)

n = size(X, 1);
K = size(X, 2) -1;

one = ones(n, 1);

C = eye(n) - (1/n)*(one*one');

delta = zeros(1, K+1);

for k = 1:K+1

delta(k) = sqrt(norm(C*X(:, k), 2) + norm(C*Y(:, k), 2));

end

end