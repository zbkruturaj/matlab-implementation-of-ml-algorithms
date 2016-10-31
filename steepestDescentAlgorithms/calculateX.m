function X = calculateX(data,m)
  X = zeros(size(data,2)-m,m);
  for i = 1:size(data,2)-m
      X(i,:) = data(i:i+m-1);
  end
end
