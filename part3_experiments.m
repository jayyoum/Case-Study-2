clear;
clc;
close all;

num_deployments = 20;
m = 4;

scores = zeros(num_deployments,4);

rng(105);

for seed = 1:num_deployments

D = make_deployment(seed);

G = D.G;
P0 = D.P0;
n = size(P0,1);

working = setdiff((1:n)',D.faulty);

S_random = working(randperm(length(working),m));

    
degree = G*ones(n,1);
[~,idx] = sort(degree(working),'descend');
S_degree = working(idx(1:m));

distance_sq = sum((P0(working,:) - D.g(:)').^2,2);
[~,idx] = sort(distance_sq,'ascend');
S_closest = working(idx(1:m));

scores(seed,1) = score_mission(D,S_random);
scores(seed,2) = score_mission(D,S_degree);
scores(seed,3) = score_mission(D,S_closest);

S_custom = choose_leaders(G,P0,D.faulty,D.g,m);
scores(seed,4) = score_mission(D,S_custom);

end

names = {'Random','Highest degree','Closest to rally','Custom'};

avg_scores = mean(scores,1);
worst_scores = min(scores,[],1);

results = table(names',avg_scores',worst_scores','VariableNames',{'Strategy','AverageScore','WorstScore'});

disp(results);


figure;
boxplot(scores,'Labels',names);
ylabel('Mission score J');
title('baseline strategies across 20 deployments');
grid on;



%%worst score examination
[worst_score, worst_seed] = min(scores(:,3));

D = make_deployment(worst_seed);

G = D.G;
P0 = D.P0;
n = size(P0,1);

working = setdiff((1:n)',D.faulty);

distance_sq = sum((P0(working,:) - D.g(:)').^2,2);
[~,idx] = sort(distance_sq,'ascend');
S_closest = working(idx(1:m));
degree = G*ones(n,1);

fprintf('\nClosest-to-rally failure, seed: %d\n',worst_seed);
fprintf('mission score: %.4f\n',worst_score);
fprintf('selected leaders: ');
disp(S_closest');

fprintf('leader degrees: ');
disp(degree(S_closest)');

fprintf('avg working robot degree: %.2f\n',mean(degree(working)));

covered = any(G(:,S_closest)>0,2);
covered(S_closest) = true;

fprintf('robots directly covered: %d of %d\n',sum(covered),n);


figure;

scatter(P0(:,1),P0(:,2),20,'filled');
hold on;

scatter(P0(D.faulty,1),P0(D.faulty,2),75,'r','filled');
scatter(P0(S_closest,1),P0(S_closest,2),90,'g','filled');

plot(D.g(1),D.g(2),'kx','MarkerSize',12,'LineWidth',2);

axis equal;
grid on;
legend('Robots','Faulty robots','Leaders','Rally point');
title(sprintf('Closest-to-rally failure: seed %d',worst_seed));

hold off;
