clear
load training.mat %training data
load validate.mat %validation data

error = zeros(28,12);
for m = 3:30 % for filter orders from 3 to 30.
  trainingX = calculateX(training',m);
  validateX = calculateX(validate',m);
  
  trainingP = calculateP(trainingX,training);
  trainingR = calculateR(trainingX);
  
  for i = 0:11 % over different regularization constants
    [m,i];
    lambda = i*0.009+0.001; % calculating regularization const. lambda
    W = calculateW(trainingR, m, lambda, trainingP); % trains models using OLS equation.
    error(m-2,i+1) = calculateLSE(validate,validateX,W)/length(validate); % stores mean square error for comparison of models
  end
end 
error
[M,I] = min(error(:));   % Outputs M and I corresponding the min values.
[I_row, I_col] = ind2sub(size(error),I);  
surf(0.001:0.009:0.1,3:30,error)
