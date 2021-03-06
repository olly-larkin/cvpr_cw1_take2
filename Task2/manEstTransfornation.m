points1 = [x1, y1];
points2 = [x2, y2];

[tformMan, inlierIdxMan] = estimateGeometricTransform2D(points1, points2, 'projective', 'MaxNumTrials', 5000);

transformedPointsMan = transformPointsForward(tformMan, points1);

[meanErrMan, medianErrMan, varianceMan, skewMan, histMan] = pointsError(transformedPointsMan, points2);

showMatchedFeatures(imread('../ImagesNew/HG/IMG_3056.JPG'), imread('../ImagesNew/HG/IMG_3058.JPG'), points1, points2)