function y = crossover_discrete(parent_1, parent_2)

a = randi(2, length(parent_1),1);
parent = [parent_1 , parent_2];
y = diag(parent(:,a));