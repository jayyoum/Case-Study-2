
function S = choose_leaders(G, P0, faulty, g, m)

n = size(G,1);

working = setdiff((1:n)', faulty(:));
m = min(m, numel(working));

degree = G*ones(n,1);

S = zeros(m,1);
covered = false(n,1);

for k = 1:m

    gain = (G + eye(n))*double(~covered);
    value = gain + 0.1*degree;
    value(faulty) = -Inf;

    if k > 1
        value(S(1:k-1)) = -Inf;
    end

    [~,best] = max(value);
    S(k) = best;

    covered = covered | (G(:,best) > 0);
    covered(best) = true;

end

end
