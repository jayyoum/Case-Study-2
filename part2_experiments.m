clear;
clc;
close all;

rng(105);
P0 = [5*rand(50, 2); 5*rand(50, 2) + [6 0]];

n = size(P0, 1);

G1 = make_complete(n);
G2 = make_star(n);

for r = 0.1:0.1:10

G = make_disk(P0,r);
[~,~,diam] = graph_stats(G);

if isfinite(diam)

r_min = r;
break;

end

end

r_min = round(r_min,1);
fprintf('r_min: %.2f\n', r_min);

G4 = make_disk(P0, r_min);

[~, edges_T4, ~] = graph_stats(G4);

k_ring = round(edges_T4/n);
k_ring = max(1, min(k_ring, floor((n-1)/2)));

G3 = make_ring(n, k_ring);

[~, edges_T3, ~] = graph_stats(G3);

fprintf('edges_T4: %d\n', edges_T4);
fprintf('k_ring: %d\n', k_ring);
fprintf('edges_T3: %d\n', edges_T3);

G1 = make_complete(n);
G2 = make_star(n);
G3 = make_ring(n, k_ring);
G4 = make_disk(P0, r_min);
G5 = make_disk(P0, round(r_min + 0.4, 1));