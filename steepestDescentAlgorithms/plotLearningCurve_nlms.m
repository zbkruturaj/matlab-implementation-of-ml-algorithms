clear
load training.mat;
load validate.mat;

figure(9)
step_size = 0.2; % best 0.004, 0.2, 0.4
filter    = 3;     % best 3

X = calculateX(training', filter);
D = calculateDesired(training', filter);
vX = calculateX(validate', filter);
vD = calculateDesired(validate', filter);

E = zeros(size(X,1),1);
vE = zeros(size(vX,1),1);
for i = 1:size(X,1)
    W = trainOver_nlms(X(1:i,:), D(1:i,:), filter, step_size);
    E(i) = calculateLSE(D, X, W)/size(X,1);
end

plot(1:20:size(X,1),smooth(E(1:20:size(E,1))));  
