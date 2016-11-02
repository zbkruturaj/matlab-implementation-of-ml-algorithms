function [sigma, mu] = calc(X)
    mu = calculateMean(X);
    for i = 1:7
        X(:,i) = X(:,i)-mu(i,:);
    end    
    sigma = X'*X/size(X,1);
end
