clear all
clc

J = [];

for run=1:100
    
    global tau tau_prime epsilon population_size q

    number_of_iteration = 1000;
    number_of_states = 30;
    population_size = 200;
    tau = 1/sqrt(2 * sqrt(number_of_states));
    tau_prime = 1/sqrt(2 * number_of_states);
    epsilon = 1e-2;
    q = 10;
    jmin = inf;

    s = randn(number_of_states, population_size);
    pop = (30+30)*rand(number_of_states, population_size)-30;

    n = 1;
    while n < number_of_iteration + 1

        % Mutacao
        [new_pop, new_s] = mutation(pop, s);

        children = [pop , new_pop];
        children_s = [s , new_s];

        j = f(children);
        jm = min(j);
        if jm < jmin
            jmin = jm;
        end
        [pop, s] = selection(j, children, children_s);
        n = n + 1;
    end
    J = [J, jmin];
end

    