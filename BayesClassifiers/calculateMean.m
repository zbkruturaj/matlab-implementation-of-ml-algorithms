function mu = calculateMean(X)
    mu = zeros(7,1);
    for i = 1:7
        mu(i,:) = mean(X(:,i));
    end
end
