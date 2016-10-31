function W = trainOver(X, D, m, alpha)
    W = zeros(m,1);
    for j = 1:size(X,1)
        e = calculateError(X(j,:), W, D(j));
        W = calculateNewWeight(W, alpha, e, X(j,:));
    end
end
