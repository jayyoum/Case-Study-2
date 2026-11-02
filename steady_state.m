%practice deployment
clear;
clc;

D = make_deployment(1);

G = D.G;
P0 = D.P0;
faulty = D.faulty;

n = size(P0,1);

W = makeWA(G);


lambda = ones(n,1);
lambda(faulty) = 0;

a = P0(:,1);
b = P0(:,2);

Lambda = diag(lambda);
I = eye(n);

x_star = (I - Lambda*W) \ ((I - Lambda)*a);
y_star = (I - Lambda*W) \ ((I - Lambda)*b);

P_star = [x_star, y_star];
K = 5000;

X = simulate_anchored(W,lambda,a,P0(:,1),K);
Y = simulate_anchored(W,lambda,b,P0(:,2),K);

P_final = [X(:,end), Y(:,end)];

error = max(vecnorm(P_final-P_star,2,2));

fprintf('Max equilibrium error: %.8f\n',error);