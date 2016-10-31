function X = calculateX(data,m)
  X = zeros(size(data,2),m);
  for i = 1:size(data,2)
    if i > m
      X(i,:) = data(i-m:i-1);
    else
      X(i,:) = [zeros(1,m-i+1),data(1:i-1)];
    end
   end
end
