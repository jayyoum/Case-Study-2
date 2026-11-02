function[G] = make_star(n)

one = ones(n,1);
e1 = eye(n,1);

G = e1*one' + one*e1' - 2*(e1*e1');

end