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

G = zeros(n, n);

for k = 1:k
    G = G + mpower(s, k) + mpower(s', k);
end

end

function[G] = make_disk()