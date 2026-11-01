clear;
clc;
close all;

rng(105);
P0 = [5*rand(50,2); 5*rand(50,2) + [6 0]];

n = size(P0,1);

G1 = make_complete(n);
G2 = make_star(n);
G3 = make_ring(n,11);
G4 = make_disk(P0,2.1);

networks = {G1,G2,G3,G4};
names = {'Complete'; 'Star'; 'Ring'; 'Disk'};

predicted_A = zeros(4,2);
predicted_B = zeros(4,2);

for i = 1:4

    G = networks{i};

    d = G*ones(n,1);
    v = ones(n,1) + d;

    predicted_A(i,:) = (v'*P0)/sum(v);
    predicted_B(i,:) = mean(P0,1);

end

K = 5000;

error_A = zeros(4,1);
error_B = zeros(4,1);

for i = 1:4
G = networks{i};
WA = makeWA(G);
WB = makeWB(G);

XA = simulate_linear(WA,P0(:,1),K);
YA = simulate_linear(WA,P0(:,2),K);
XB = simulate_linear(WB,P0(:,1),K);
YB = simulate_linear(WB,P0(:,2),K);

final_A = [XA(:,end), YA(:,end)];
final_B = [XB(:,end), YB(:,end)];

error_A(i) = max(vecnorm(final_A - predicted_A(i,:),2,2));
error_B(i) = max(vecnorm(final_B - predicted_B(i,:),2,2));

end

results = table(names, error_A, error_B, 'VariableNames', {'Network','ErrorA','ErrorB'});

disp(results);



%T2 star protocol comparison
centroid = mean(P0,1);

distance_A = norm(predicted_A(2,:) - centroid);
distance_B = norm(predicted_B(2,:) - centroid);

fprintf('A distance from avg: %.6f\n', distance_A);
fprintf('B distance from avg: %.6f\n', distance_B);

K = 1000;

WA = makeWA(G2);
WB = makeWB(G2);

XA = simulate_linear(WA,P0(:,1),K);
YA = simulate_linear(WA,P0(:,2),K);
XB = simulate_linear(WB,P0(:,1),K);
YB = simulate_linear(WB,P0(:,2),K);

delta_A = measure_spread(XA,YA);
delta_B = measure_spread(XB,YB);

idx_A = find(delta_A <= 0.01*delta_A(1), 1, 'first');
idx_B = find(delta_B <= 0.01*delta_B(1), 1, 'first');

fprintf('A rendezvous time: %d\n', idx_A-1);
fprintf('B rendezvous time: %d\n', idx_B-1);