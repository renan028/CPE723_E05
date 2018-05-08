function [pop, s] = selection(j, children, children_s)
global population_size q

children_size = size(children, 2);
games = zeros(q, children_size);

for game=1:q
    p = randperm(children_size);
    for match=1:children_size/2
        player_1 = p(match * 2 - 1);
        player_2 = p(match * 2);
        if j(player_1) < j(player_2)
            games(game, player_1) = 1;
        elseif j(player_1) > j(player_2)
            games(game, player_2) = 1;
        end
    end
end

games = sum(games, 1);       

[~, jsort_index]=sort(games, 'descend'); 
jsort_index = jsort_index(1:population_size);

pop = children(:,jsort_index);
s = children_s(:,jsort_index);