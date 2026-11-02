function [M] = simulate_linear(W, x0, K)

n = size(x0,1);

M = zeros(n,K+1);

M(:,1) = x0;

for k = 1:K
    M(:,k+1) = W * M(:,k);
end

end