E1

Prediction

We predict T1 complete will have the smallest rendezvous time since it has
the most edges, largest mean and max degree, and the smallest diameter. 
Since all robots are connected to each other, it is normal to expect this 
network to gather the quickest. T2 star has low edges and mean degree, but its 
diameter is low because there is one central robot connecting all others,
which is reflected by its high max degree, so we expect this network to be
second. and ring and disk to take more time to rendezvous. Despite similar
statistics, T3 disk will take longer than T4 ring due to the physical separation
of the robots into two areas, though increasing the radius by 0.4 will reduce
rendezvous time slightly.

Post-experiment observations

The results of experiment 1 were mostly aligned with our predictions, where 
T1 complete had the lowest rendezvous time of 1, followed closely by T2 star
with a time of 7. The T3 ring and T4 disk comparison was also as we had predicted,
where the ring had significantly less rendezvous time compared to disk (both r's)
due to the initial physical separation of the robots. One unexpected outcome, however,
was how much rendezvous time was decreased solely by increasing the radius of disk by
0.4, from over 2700 rendezvous time at r = 2.1 to only around 330 for r = 2.5. Reflecting
back, this significant decrease is somewhat to be expected as a 0.4 radius increase can 
be significant in a 5x5 space.

E2

Prediction

We predict protocol B will converge closer to the swarm's average position compared
to protocol A, because B's convergence formula we derived shows us that it'll
converge to the ordinary average of the initial positions, while A will converge
towards the weighted average, where the degree of each robot plays a factor. We 
also predict protocol A will converge faster because, on the star network, each
peripheral robot moves halfway toward the hub at each step, while for protocol B,
each peripheral robot moves only 1/99 of the way towards the hub because of the
common step size determined by max degree.

Post-experiment observations

The results of experiment 2 were as we had predicted. B's distance from the avg
was 0, since we had derived B would converge to the ordinary average. A's distance
was higher, since it took into account the degree-weighted average. For rendezvous 
time, A converged quicker, and B took a lot more to converge due to the small step
size each peripheral robot was taking. 