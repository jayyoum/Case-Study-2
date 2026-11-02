function M = simulate_anchored(W, lambda, a, x0, K)

n = size(x0,1);

Lambda = diag(lambda);
A = Lambda*W;
b = (eye(n)-Lambda)*a;

M = zeros(n,K+1);
M(:,1) = x0;

for k = 1:K
    M(:,k+1) = A*M(:,k) + b;
end

end