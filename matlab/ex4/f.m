function y = f(x, data)
n = size(x,1)/2;
y = zeros(1, n);
for i=1:n
    clusters = x(i * 2 - 1:i*2, :);
    distances = zeros(size(data, 1), 1);
    for j=1:size(data,1)
        distances(j) = min(sum((clusters - data(j, :)').^2));
    end
    y(i) = (1/size(data,1)) * sum(distances); 
end
