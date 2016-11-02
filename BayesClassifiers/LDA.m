T = readtable('HW4.txt');
contents = T{:,{'Species', 'FrontalLip', 'RearWidth', 'Length', 'Width', 'Depth', 'Male', 'Female'}};

trainingX = contents(1:140,2:8);
trainingY = contents(1:140,1);
testingX = contents(141:200,2:8);
testingY = contents(141:200,1);

trainingX0 = trainingX(trainingY==0,:);
trainingX1 = trainingX(trainingY==1,:);

[sigma0, mu0] = calc(trainingX0);
[sigma1, mu1] = calc(trainingX1);

T = -12;
th = 0.5*(mu0'*pinv(sigma0)*mu0 - mu1'*pinv(sigma1)*mu1 + T);

coeff_x = pinv((sigma1 + sigma0)/2)*(mu1-mu0);

pred = zeros(size(trainingY));
for i = 1:size(trainingX,1)
    pred(i,:) = trainingX(i,:) * coeff_x > 0.5*(th);
end

accuracy_tr = sum(pred==trainingY)/size(trainingY,1);

pred = zeros(size(testingY));
for i = 1:size(testingX,1)
    pred(i,:) = testingX(i,:) * coeff_x > 0.5*(th);
end

accuracy_te = sum(pred==testingY)/size(testingY,1);
