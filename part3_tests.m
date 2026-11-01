G = make_complete(3);
W = makeWA(G);

lambda = [1; 0.5; 0];
a = [0; 10; 5];
x0 = [2; 4; 5];

M = simulate_anchored(W, lambda, a, x0, 1);

disp(M);