%simulate_linear

G = make_complete(5);
W = makeWA(G);

x0 = [1;2;3;4;5];
K = 3;

M = simulate_linear(W,x0,K);

disp(M(:, end));
disp(W^K*x0);

%measure_spread

X = [0 1 2; 2 2 2; 4 3 2];

Y = zeros(3,3);

delta = measure_spread(X,Y);

disp(delta);
disp([sqrt(8), sqrt(2), 0])