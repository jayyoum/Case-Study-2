%%make_complete
G = make_complete(5);
disp(G);

%%make_star
G = make_star(5);
disp(G);

%%make_ring
G = make_ring(5,1);
disp(G);

%%make_disk
P = [0 0; 1 0; 3 0];
G = make_disk(P,1.5);
disp(G);

%%graph_stats
G = make_star(5);
[d, edges, diam] = graph_stats(G);

disp(d);
fprintf('Edges: %d\n',edges);
fprintf('Diameter: %d\n',diam);