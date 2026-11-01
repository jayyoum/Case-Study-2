clear;
clc;
close all;

rng(105);
P0 = [5*rand(50,2); 5*rand(50,2) + [6 0]];

n = size(P0,1);

r_min = 2.1;
k_ring = 11;

G1 = make_complete(n);
G2 = make_star(n);
G3 = make_ring(n,k_ring);
G4 = make_disk(P0,r_min);
G5 = make_disk(P0,r_min+0.4);

networks = {G1,G2,G3,G4,G5};

names = {'Complete', 'Star', 'Ring', 'Disk (r=2.1)', 'Disk (r=2.5)'};

K = 2706;

rendezvous_times = NaN(5,1);
spreads = cell(5,1);

for i = 1:5

    W = makeWA(networks{i});

    X = simulate_linear(W,P0(:,1),K);
    Y = simulate_linear(W,P0(:,2),K);

    delta = measure_spread(X,Y);

    spreads{i} = delta;

    idx = find(delta <= 0.01*delta(1),1,'first');

    if ~isempty(idx)
        rendezvous_times(i) = idx - 1;
    end

end

figure;
hold on;

for i = 1:5
    semilogy(0:K, spreads{i});
end

set(gca, 'YScale', 'log');
xlabel('Time step k');
ylabel('Spread \delta[k]');
title('Experiment 1 Rendezvous Visualization');

legend(names);
grid on;
hold off;

results = table(names',rendezvous_times, 'VariableNames',{'Network','RendezvousTime'});

disp(results);