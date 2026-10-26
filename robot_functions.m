
function[G] = make_complete(n)

one = ones(n, n);
G = one - eye(n);

end

function[G] = make_star(n)

G = zeros(n, n);
G(1, 2:n) = 1;
G(2:n,  1) = 1;

end

function[G] = make_ring(n, k)

% where s is the left-shifted identity matrix
% cyclic shift matrix S
srow1 = zeros(1,n);
s = eye(n);
S = vertcat(srow1, s);

% matrix G
G = zeros(n, n);

for j = 1:k
    G = G + mpower(S, j) + mpower(S', j);
end

end

%function[G] = make_disk()

%n = 100;
%srow1 = zeros(1,n);
%s= eye(n);
%s = vertcat(srow1, s);