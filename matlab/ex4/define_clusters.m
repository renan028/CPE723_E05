function clusters = define_clusters(map_size, number_of_clusters, threshold)
clusters = [rand(1,2) * map_size];
for i=2:number_of_clusters
    new_cluster = rand(1,2) * map_size;
    while min(sum((clusters - new_cluster).^2,2).^0.5) < threshold
        new_cluster = rand(1,2) * map_size;
    end
    clusters = [clusters ; new_cluster];
end