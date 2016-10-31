function[X] = Calculate_Matrix(data,m)
    % The time series data is converted to a Matrix by this function to easily deal with it hereon.
  X1=zeros(size(data,1),m);
  for j=1:m
    for i=1:size(data,1)-j    
     X(i+j,j)=data(i);
     end
   end
 end
