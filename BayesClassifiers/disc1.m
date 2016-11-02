function G = disc1(X, sigma, mu, class_len)
    G = zeros(size(X,1),1);
    p = class_len/size(X,1);
    sigma_det = det(sigma);
    sigma_inv = pinv(sigma);
    const = -3.5*log(2*pi)-0.5*log(sigma_det)+log(p);
    for i = 1:size(X,1)
        G(i,:) = -0.5*(X(i,:)'-mu)'*sigma_inv*(X(i,:)'-mu) + const;
    end
end
