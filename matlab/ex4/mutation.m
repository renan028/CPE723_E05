function [y, s] = mutation(x, s)
global tau tau_prime epsilon population_size

s = s.*exp(tau_prime * randn(size(s,1), 1) + tau * randn(size(s)));
s(s<epsilon) = epsilon;

y = x + s.*randn(size(x));
