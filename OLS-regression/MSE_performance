clear
load training.mat
load test.mat
load testnoisy.mat

%Evaluates MSE for filterOrders 4,8 and 30.

error = zeros(3,1);
m = 4;
lambda = 0.001;
trainingX = calculateX(training',m);
testnoisyX = calculateX(testnoisy',m);
trainingP = calculateP(trainingX,training);
trainingR = calculateR(trainingX);
W = calculateW(trainingR, m, lambda, trainingP);
error(1) = calculateLSE(test, testnoisyX,W)/length(test);


m = 8;
lambda = 0.001;
trainingX = calculateX(training',m);
testnoisyX = calculateX(testnoisy',m);
trainingP = calculateP(trainingX,training);
trainingR = calculateR(trainingX);
W = calculateW(trainingR, m, lambda, trainingP);
error(2) = calculateLSE(test, testnoisyX,W)/length(test);

m = 30;
lambda = 0.001;
trainingX = calculateX(training',m);
testnoisyX = calculateX(testnoisy',m);
trainingP = calculateP(trainingX,training);
trainingR = calculateR(trainingX);
W = calculateW(trainingR, m, lambda, trainingP);
error(3) = calculateLSE(test, testnoisyX,W)/length(test);
