clear;
load training.mat;          % 3000*1
load validate.mat;          % 1000*1

error = zeros(28,10);       % 28*10
for m = 3:30        
    X = calculateX(training',m);            % (3000-m)*m
    D = calculateDesired(training',m);      % (3000-m)*1
    R = calculateAutoCorrelationMatrix(X);  % m*m
    Lambda  = svd(R);                       
    l_min = min(Lambda);
    l_max = max(Lambda);
    eta_lim = 1/l_max;
    vX = calculateX(validate', m);          % (1000-m)*m
    vD = calculateDesired(validate',m);     % (1000-m)*1
    for i = 1:10
        alpha = eta_lim/i;
        W = trainOver_nlms(X, D, m, alpha);                                               % m*1
        error(m-2,i) = calculateLSE(vD,vX,W)/(length(validate)-m);   
    end
end
surf(eta_lim*((1:10).^-1),3:30,error);
