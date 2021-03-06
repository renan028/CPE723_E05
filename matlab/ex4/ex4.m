clear all
clc


global tau tau_prime epsilon population_size 

map_size = 10;
number_of_clusters = 2;
number_of_points_per_cluster = 20;
cluester_threshold = 2;
data_threshold = 0.1;

clusters = define_clusters(map_size, number_of_clusters, cluester_threshold);
data = generate_data(clusters, number_of_points_per_cluster, data_threshold);

number_of_iteration = 1000;
population_size = 30;
number_of_parents = 100;
tau = 0.1/sqrt(2 * sqrt(number_of_clusters * 2));
tau_prime = 0.1/sqrt(4 * number_of_clusters);
epsilon = 1e-2;
jmin = inf;

s = randn(2 * population_size, number_of_clusters);
pop = rand(2 * population_size, number_of_clusters) * map_size; 
best_cluster = [];

n = 1;
while n < number_of_iteration+1

    % Recombinacao
    children = zeros(2 * number_of_parents, number_of_clusters);
    children_s = zeros(2 * number_of_parents, number_of_clusters);
    i = 1;
    while i < number_of_parents
        index_1 = randi(population_size);
        index_2 = randi(population_size);
        if index_1 == index_2
            continue
        end
        children(i:i+1,:) = ...
            crossover_discrete(pop(index_1 * 2 - 1:index_1 * 2,:), ...
            pop(index_2 * 2 - 1:index_2 * 2,:));
        children_s(i:i+1,:) = ...
            crossover_global_intermediate( ...
            s(index_1 * 2 - 1:index_1 * 2,:), ...
            s(index_2 * 2 - 1:index_2 * 2,:));
        i = i + 1;
    end

    % Mutacao
    [children, children_s] = mutation(children, children_s);

    j = f(children, data);
    [jm, index] = min(j);
    if jm < jmin
        jmin = jm;
        best_cluster = children(index * 2 - 1:index * 2,:);
    end
    [pop, s] = comma_selection(j, children, children_s);
    n = n + 1;
end

    