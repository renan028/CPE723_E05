function y = f(x)
number_of_states = size(x,1);
y = -20 * exp(- 0.2 * sqrt(sum(x.*x)/number_of_states)) - ...
    exp(sum(cos(2*pi*x)/number_of_states)) + 20 + exp(1);