function W = calculateW(R,m,lambda,P)
  W =(R-lambda*eye(m)) \ P;
end
