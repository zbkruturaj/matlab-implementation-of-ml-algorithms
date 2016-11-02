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

g0 = disc1(trainingX, sigma0, mu0, size(trainingX0,1)); % discriminant function
g1 = disc1(trainingX, sigma1, mu1, size(trainingX1,1));

pred = g1>g0;

accuracy_tr = sum(pred==trainingY)/size(trainingY,1);

g0 = disc1(testingX, sigma0, mu0, size(trainingX0,1));
g1 = disc1(testingX, sigma1, mu1, size(trainingX1,1));

pred = g1>g0;

accuracy_te = sum(pred==testingY)/size(testingY,1);
