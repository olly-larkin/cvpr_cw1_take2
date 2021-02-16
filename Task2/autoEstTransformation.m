img1 = imread('../ImagesNew/HG/IMG_3056.JPG');
grayImg1 = rgb2gray(img1);
img2 = imread('../ImagesNew/HG/IMG_3058.JPG');
grayImg2 = rgb2gray(img2);

points1 = detectKAZEFeatures(grayImg1);
points2 = detectKAZEFeatures(grayImg2);

[feats1, vpts1] = extractFeatures(grayImg1, points1);
[feats2, vpts2] = extractFeatures(grayImg2, points2);

pairs = matchFeatures(feats1, feats2, "Unique", true, "Method", 'Approximate');
matchedPoints1 = vpts1(pairs(:,1));
matchedPoints2 = vpts2(pairs(:,2));

[tformAuto, inlierIdxAuto] = estimateGeometricTransform2D(matchedPoints1, matchedPoints2, 'projective', 'MaxNumTrials', 2500);

usedPoints1 = matchedPoints1(inlierIdxAuto);
usedPoints2 = matchedPoints2(inlierIdxAuto);

transformedPointsAuto = transformPointsForward(tformAuto, matchedPoints1.Location);
transformedPointsAutoUsed = transformPointsForward(tformAuto, usedPoints1.Location);

[meanErrAuto, medianErrAuto, varianceAuto, skewAuto, histAuto] = pointsError(transformedPointsAuto, matchedPoints2.Location);
[meanErrAutoUsed, medianErrAutoUsed, varianceAutoUsed, skewAutoUsed, histAutoUsed] = pointsError(transformedPointsAutoUsed, usedPoints2.Location);

figure
showMatchedFeatures(img1, img2, matchedPoints1.Location, matchedPoints2.Location)
figure
showMatchedFeatures(img1, img2, usedPoints1.Location, usedPoints2.Location)