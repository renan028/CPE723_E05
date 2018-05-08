function data = generate_data(clusters, number_of_points_per_cluster, data_threshold)
data = [];
for i=1:size(clusters,1)
    x = rand(number_of_points_per_cluster,2);
    x(:,1) = x(:,1) + clusters(i,1) - data_threshold;
    x(:,2) = x(:,2) + clusters(i,2) - data_threshold;
    data = [data ; x];
end