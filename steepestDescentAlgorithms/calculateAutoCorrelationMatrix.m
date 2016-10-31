function R = calculateAutoCorrelationMatrix(X)
    R = (X'*X)/size(X,1);
end
