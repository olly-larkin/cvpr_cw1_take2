I1Size = size(img1);
I2Size = size(img2);

[t1,t2] = estimateUncalibratedRectification(F,usedPoints1,usedPoints2,size(img2));
[I1Rect,I2Rect] = rectifyStereoImages(img1,img2,t1,t2);

tform1 = projective2d(t1);
epiNewPoints1 = epiPoints1;
epiNewPoints1(:, [1, 2]) = transformPointsForward(tform1, epiPoints1(:,[1,2]));
epiNewPoints1(:, [3, 4]) = transformPointsForward(tform1, epiPoints1(:,[3,4]));
epiNewPoints1(:,1) = 0;
epiNewPoints1(:,3) = I1Size(2);

tform2 = projective2d(t2);
epiNewPoints2 = epiPoints2;
epiNewPoints2(:, [1, 2]) = transformPointsForward(tform2, epiPoints2(:,[1,2]));
epiNewPoints2(:, [3, 4]) = transformPointsForward(tform2, epiPoints2(:,[3,4]));
epiNewPoints2(:,1) = 0;
epiNewPoints2(:,3) = I2Size(2);

figure
imshow(I1Rect);
hold on;
line(epiNewPoints1(:,[1,3])',epiNewPoints1(:,[2,4])');
figure
imshow(I2Rect);
hold on;
line(epiNewPoints2(:,[1,3])',epiNewPoints2(:,[2,4])');
