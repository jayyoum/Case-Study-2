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

%%comparison table

G1 = make_complete(n);
G2 = make_star(n);
G3 = make_ring(n, k_ring);
G4 = make_disk(P0, r_min);

networks = {G1, G2, G3, G4};
names = {'T1 Complete'; 'T2 Star'; 'T3 Ring'; 'T4 Disk'};

edge_counts = zeros(4,1);
mean_degrees = zeros(4,1);
max_degrees = zeros(4,1);
diameters = zeros(4,1);

for i = 1:4

    [d, E, diam] = graph_stats(networks{i});

    edge_counts(i) = E;
    mean_degrees(i) = mean(d);
    max_degrees(i) = max(d);
    diameters(i) = diam;

end

results = table(names, edge_counts, mean_degrees, max_degrees, diameters, 'VariableNames', {'Network', 'Edges', 'MeanDegree', 'MaxDegree', 'Diameter'});

disp(results);

%%t4 plot

figure;
hold on;

[i, j] = find(triu(G4, 1));

for e = 1:length(i)

    plot(P0([i(e), j(e)], 1), ...
        P0([i(e), j(e)], 2), ...
        '-', 'Color', [0.75 0.75 0.75]);

end

scatter(P0(:,1), P0(:,2), 25, 'filled');

xlabel('X Position');
ylabel('Y Position');
title(sprintf('T4 Disk Network (r = %.1f)', r_min));

axis equal;
grid on;
hold off;