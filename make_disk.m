function[G] = make_disk(P,r)
n = size(P, 1);
one = ones(n,1);
s = sum(P.^2,2); %sq every element, sum along rows

delta = (s*one')+(one*s')-(2*(P*P'));

G = double(delta <= r^2); %for each robot pair, convert distance into 1 or 0 based on whether the robots are within radius
G(1:n+1:end) = 0; %set the diagonal of G to 0, avoiding self-connection.

end