clear;
load project1.mat;

m = 2;
mu=0.0005;

X = calculateX(training, m); 
Y = training(:,m:70000)';

W_vec = zeros(m,size(X,1));
W = zeros(m,1);
    
for i = 1:size(X,1)
    sample_error = Y(i,:) - X(i,:)*W;
    W = W + mu*conj(sample_error)*X(i,:)'/(X(i,:)*X(i,:)');
    W_vec(:,i) = W;
end

for i = 1:16;
    j = 2^i;
    W_v(:,i) = W_vec(:,j);
end
W_v = [W_v, W_vec(:,69999)];

MSE = zeros(401,401);

for W1 = 1:401
    for W2 = 1:401
        W = [-2.01+W1*0.01,-2.01+W2*0.01]';
        MSE(W1,W2) = mean((Y - X*W).^2);
    end
end
figure(2)
%[X,Y] = meshgrid(-1.5487:0.01:2.4513,-2.8586:0.01:1.1414);
contour(-2:0.01:2,-2:0.01:2,MSE,100)
hold on;
W_v
scatter(0,0);
for w = W_v
    scatter(w(2),w(1))
end
