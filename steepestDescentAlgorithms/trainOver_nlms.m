function W = trainOver_nlms(X, D, m, alpha)
    W = zeros(m,1);
    for j = 1:size(X,1)
        e = calculateError(X(j,:), W, D(j));
        W = calculateNewWeight(W, alpha, e, (X(j,:)/(X(j,:)*X(j,:)')));
    end
end
