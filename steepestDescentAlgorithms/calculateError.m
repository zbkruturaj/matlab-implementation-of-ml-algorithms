function e = calculateError(X,W,d)
    y_hat = X*W;
    e = d - y_hat;
end
