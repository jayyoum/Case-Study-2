G = make_complete(3);
W = makeWA(G);

lambda = [1; 0.5; 0];
a = [0; 10; 5];
x0 = [2; 4; 5];

M = simulate_anchored(W, lambda, a, x0, 1);

disp(M);

%scoring
D = make_deployment(1);

J0 = score_mission(D, []);

fprintf('No leader score: %.6f\n', J0);

assert(abs(J0) < 1e-10);

%choose leaders
D = make_deployment(1);

tic;

S = choose_leaders(D.G,D.P0,D.faulty,D.g,4);

toc;

disp(S');

