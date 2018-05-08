function [y, s] = mutation(x, s)
global tau tau_prime epsilon population_size

s = s.*exp(tau_prime * randn(1, population_size) + tau * randn(size(x)));
s(s<epsilon) = epsilon;

y = x + s.*randn(size(x));

