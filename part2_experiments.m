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
fprintf('Minimum radius: %.1f\n',r_min);