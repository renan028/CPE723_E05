function children = crossover_discrete(parent_1, parent_2)

children = parent_1(:,:);
for i=1:size(children, 2)
    for j=1:size(children, 1)
        if randi(2) == 2
            children(j, i) = parent_2(j, i);
        end
    end
end