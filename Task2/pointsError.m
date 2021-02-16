function [meanErr, medianErr, variance, skew, hist] = pointsError(points1, points2)
    eDist = vecnorm(points1-points2, 2, 2);
    hist = histogram(eDist, 500);
    meanErr = mean(eDist);
    medianErr = median(eDist);
    variance = var(eDist);
    skew = skewness(eDist);
end