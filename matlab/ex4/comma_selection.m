function [pop, s] = comma_selection(j, children, children_s)
global population_size
[~, jsort_index]=sort(j, 'ascend'); 
jsort_index = jsort_index(1:population_size);

pop = [];
s = [];
for i=1:length(jsort_index)
    index = jsort_index(i);
    pop = [pop ; children(index * 2 - 1:index * 2, :)];
    s = [s; children_s(index * 2 - 1:index * 2, :)];
end