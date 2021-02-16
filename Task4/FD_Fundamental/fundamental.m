img1 = imread('../../ImagesNew/FD/IMG_3032.JPG');
grayImg1 = rgb2gray(img1);
img2 = imread('../../ImagesNew/FD/IMG_3034.JPG');
grayImg2 = rgb2gray(img2);

points1 = detectKAZEFeatures(grayImg1);
points2 = detectKAZEFeatures(grayImg2);

[feats1, vpts1] = extractFeatures(grayImg1, points1);
[feats2, vpts2] = extractFeatures(grayImg2, points2);

pairs = matchFeatures(feats1, feats2, "Unique", true, "Method", 'Approximate');
matchedPoints1 = vpts1(pairs(:,1));
matchedPoints2 = vpts2(pairs(:,2));

[F, inlierIdxAuto, status] = estimateFundamentalMatrix(matchedPoints1, matchedPoints2, 'NumTrials', 2500, 'Method', 'LTS', 'InlierPercentage', 10);

usedPoints1 = matchedPoints1(inlierIdxAuto);
usedPoints2 = matchedPoints2(inlierIdxAuto);

%N = 10;
%strongest1 = selectStrongest(usedPoints1, N);
%strongest2 = selectStrongest(usedPoints2, N);

[isIn1, epipole1] = isEpipoleInImage(F, size(img1));
[isIn2, epipole2] = isEpipoleInImage(F', size(img2));

epiLines1 = epipolarLine(F', usedPoints2.Location);
epiPoints1 = lineToBorderPoints(epiLines1, size(img1));

figure;
imshow(img1);
if isIn1
    title('Contains Epipole');
else
    title('Does Not Contain Epipole');
end
hold on;
plot(usedPoints1.Location(:,1), usedPoints1.Location(:,2), 'go');
line(epiPoints1(:,[1,3])',epiPoints1(:,[2,4])');
if isIn1
    plot(epipole1(1,1), epipole1(1,2), 'ro', 'MarkerSize', 20);
end
hold off;

epiLines2 = epipolarLine(F, usedPoints1.Location);
epiPoints2 = lineToBorderPoints(epiLines2, size(img2));

figure;
imshow(img2);
if isIn2
    title('Contains Epipole');
else
    title('Does Not Contain Epipole');
end
hold on;
plot(usedPoints2.Location(:,1), usedPoints2.Location(:,2), 'go');
line(epiPoints2(:,[1,3])',epiPoints2(:,[2,4])');
if isIn2
    plot(epipole2(1,1), epipole2(1,2), 'ro', 'MarkerSize', 20);
end
hold off;
