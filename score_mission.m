
function J = score_mission(D, S)

G = D.G;
P0 = D.P0;
faulty = D.faulty;
g = D.g;

n = size(P0,1);
m = 4;
T = 125;

S = S(:);

working = setdiff((1:n)',faulty);

W = makeWA(G);

lambda_base = ones(n,1);
lambda_base(faulty) = 0;

lambda_new = lambda_base;
lambda_new(S) = 0.5;

anchors = P0;
anchors(S,:) = repmat(g(:)',numel(S),1);

Xbase = simulate_anchored(W,lambda_base,P0(:,1),P0(:,1),T);
Ybase = simulate_anchored(W,lambda_base,P0(:,2),P0(:,2),T);

Xnew = simulate_anchored(W,lambda_new,anchors(:,1),P0(:,1),T);
Ynew = simulate_anchored(W,lambda_new,anchors(:,2),P0(:,2),T);

ebase = mean((Xbase(working,2:end)-g(1)).^2 + (Ybase(working,2:end)-g(2)).^2,1);

enew = mean((Xnew(working,2:end)-g(1)).^2 + (Ynew(working,2:end)-g(2)).^2,1);

J = 100*mean(1 - enew./ebase);

end
