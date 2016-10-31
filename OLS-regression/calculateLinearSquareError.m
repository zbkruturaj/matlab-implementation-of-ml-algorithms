function LSE = calculateLSE(Y,X,W)
  % Calculates Linear Square Error between desired signal and the predicted signal.
  Ycap = X*W;
  LSE = sum((Y - Ycap).^2);
end 
