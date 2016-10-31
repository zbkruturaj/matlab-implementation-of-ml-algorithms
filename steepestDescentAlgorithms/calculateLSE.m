function LSE = calculateLSE(Y,X,W)
  Ycap = X*W;
  LSE = sum((Y - Ycap).^2);
end 
